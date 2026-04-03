from datetime import datetime, date
from flask import Blueprint, request, jsonify, g
from sqlalchemy import func
from app import db
from app.middleware.auth import require_auth
from app.models.course import Curso, Pregunta, Inscripcion, ProgresoUsuario, RespuestaUsuario
from app.models.user import NivelUsuario

courses_bp = Blueprint('courses', __name__)

PUNTOS_POR_ACIERTO = 10


def _update_nivel(user_id, puntos_ganados):
    """Suma puntos y actualiza racha de días al usuario."""
    nivel = NivelUsuario.query.filter_by(usuario_id=user_id).first()
    if not nivel:
        return

    nivel.puntos_totales += puntos_ganados

    hoy = date.today()
    ultima = nivel.fecha_ultima_actividad
    if ultima != hoy:
        nivel.racha_dias = nivel.racha_dias + 1 if ultima and (hoy - ultima).days == 1 else 1
        nivel.fecha_ultima_actividad = hoy

    # Subir de nivel cada 100 puntos
    nivel.nivel_actual = max(1, nivel.puntos_totales // 100 + 1)


def _update_progreso(user_id, curso_id, is_new, is_correct, was_correct):
    """Actualiza ProgresoUsuario y devuelve el objeto."""
    progreso = ProgresoUsuario.query.filter_by(
        usuario_id=user_id, curso_id=curso_id
    ).first()
    if not progreso:
        return None

    if is_new:
        progreso.preguntas_respondidas += 1
        if is_correct:
            progreso.preguntas_correctas += 1
    else:
        if not was_correct and is_correct:
            progreso.preguntas_correctas += 1
        elif was_correct and not is_correct:
            progreso.preguntas_correctas -= 1

    total = progreso.preguntas_respondidas
    progreso.porcentaje_completado = (progreso.preguntas_correctas / total * 100) if total else 0
    progreso.fecha_ultima_actividad = datetime.utcnow()
    return progreso


@courses_bp.get('/')
def get_courses():
    cursos = Curso.query.filter_by(activo=True).all()
    return jsonify([c.to_dict() for c in cursos])


@courses_bp.get('/<int:course_id>')
def get_course(course_id):
    curso = Curso.query.get_or_404(course_id)
    return jsonify(curso.to_dict())


@courses_bp.post('/<int:course_id>/enroll')
@require_auth
def enroll(course_id):
    Curso.query.get_or_404(course_id)
    user_id = g.current_user.id

    existing = Inscripcion.query.filter_by(usuario_id=user_id, curso_id=course_id).first()
    if existing:
        if not existing.activa:
            existing.activa = True
            db.session.commit()
        return jsonify(existing.to_dict()), 200

    inscripcion = Inscripcion(usuario_id=user_id, curso_id=course_id)
    progreso = ProgresoUsuario(usuario_id=user_id, curso_id=course_id)
    db.session.add(inscripcion)
    db.session.add(progreso)
    db.session.commit()
    return jsonify(inscripcion.to_dict()), 201


@courses_bp.get('/<int:course_id>/topics')
def get_topics(course_id):
    Curso.query.get_or_404(course_id)
    lecciones = (
        db.session.query(Pregunta.leccion)
        .filter_by(id_curso=course_id, activa=True)
        .distinct()
        .order_by(Pregunta.leccion)
        .all()
    )
    topics = [
        {'id_tema': l.leccion, 'nombre_tema': f'Lección {l.leccion}', 'orden': l.leccion}
        for l in lecciones
    ]
    return jsonify(topics)


@courses_bp.get('/topics/<int:topic_id>/questions')
def get_questions(topic_id):
    preguntas = Pregunta.query.filter_by(leccion=topic_id, activa=True).all()
    return jsonify([p.to_dict() for p in preguntas])


@courses_bp.post('/questions/<int:question_id>/answer')
@require_auth
def answer_question(question_id):
    data = request.get_json()
    answer = data.get('answer')
    time_spent = data.get('time_spent', 0)

    if not answer:
        return jsonify({'error': 'Respuesta requerida'}), 400

    pregunta = Pregunta.query.get_or_404(question_id)
    is_correct = pregunta.respuesta_correcta == answer
    user_id = g.current_user.id

    existing = RespuestaUsuario.query.filter_by(
        id_pregunta=question_id, id_usuario=user_id
    ).first()

    is_new = existing is None
    if existing:
        was_correct = existing.resultado
        existing.respuesta_usuario = answer
        existing.resultado = is_correct
        existing.tiempo_respuesta = time_spent
        respuesta = existing
    else:
        was_correct = None
        respuesta = RespuestaUsuario(
            id_pregunta=question_id,
            id_usuario=user_id,
            respuesta_usuario=answer,
            resultado=is_correct,
            tiempo_respuesta=time_spent,
        )
        db.session.add(respuesta)

    progreso = _update_progreso(user_id, pregunta.id_curso, is_new, is_correct, was_correct)

    if is_new and is_correct:
        _update_nivel(user_id, PUNTOS_POR_ACIERTO)
    elif not is_new and not was_correct and is_correct:
        _update_nivel(user_id, PUNTOS_POR_ACIERTO)

    db.session.commit()

    return jsonify({
        'respuesta': respuesta.to_dict(),
        'es_correcta': is_correct,
        'respuesta_correcta': pregunta.respuesta_correcta,
        'explicacion': pregunta.explicacion,
        'progreso': {
            'preguntas_respondidas': progreso.preguntas_respondidas if progreso else 0,
            'preguntas_correctas': progreso.preguntas_correctas if progreso else 0,
            'porcentaje_completado': float(progreso.porcentaje_completado) if progreso else 0,
            'porcentaje_aciertos': (
                progreso.preguntas_correctas / progreso.preguntas_respondidas * 100
                if progreso and progreso.preguntas_respondidas else 0
            ),
        },
    }), 200


@courses_bp.post('/questions/bulk-answer')
@require_auth
def bulk_answer():
    data = request.get_json()
    answers = data.get('answers', [])
    user_id = g.current_user.id
    results = []
    puntos_ganados = 0

    # Agrupar cambios de progreso por curso
    progreso_delta = {}  # curso_id -> {respondidas, correctas}

    for item in answers:
        question_id = item.get('id_pregunta')
        answer = item.get('respuesta_usuario')
        time_spent = item.get('tiempo_respuesta', 0)

        pregunta = Pregunta.query.get(question_id)
        if not pregunta:
            continue

        is_correct = pregunta.respuesta_correcta == answer
        existing = RespuestaUsuario.query.filter_by(
            id_pregunta=question_id, id_usuario=user_id
        ).first()

        curso_id = pregunta.id_curso
        if curso_id not in progreso_delta:
            progreso_delta[curso_id] = {'respondidas': 0, 'correctas': 0}

        if existing:
            was_correct = existing.resultado
            existing.respuesta_usuario = answer
            existing.resultado = is_correct
            existing.tiempo_respuesta = time_spent
            results.append(existing)
            if not was_correct and is_correct:
                progreso_delta[curso_id]['correctas'] += 1
                puntos_ganados += PUNTOS_POR_ACIERTO
            elif was_correct and not is_correct:
                progreso_delta[curso_id]['correctas'] -= 1
        else:
            respuesta = RespuestaUsuario(
                id_pregunta=question_id,
                id_usuario=user_id,
                respuesta_usuario=answer,
                resultado=is_correct,
                tiempo_respuesta=time_spent,
            )
            db.session.add(respuesta)
            results.append(respuesta)
            progreso_delta[curso_id]['respondidas'] += 1
            if is_correct:
                progreso_delta[curso_id]['correctas'] += 1
                puntos_ganados += PUNTOS_POR_ACIERTO

    # Aplicar deltas de progreso
    for curso_id, delta in progreso_delta.items():
        progreso = ProgresoUsuario.query.filter_by(
            usuario_id=user_id, curso_id=curso_id
        ).first()
        if progreso:
            progreso.preguntas_respondidas += delta['respondidas']
            progreso.preguntas_correctas += delta['correctas']
            total = progreso.preguntas_respondidas
            progreso.porcentaje_completado = (
                progreso.preguntas_correctas / total * 100 if total else 0
            )
            progreso.fecha_ultima_actividad = datetime.utcnow()

    if puntos_ganados > 0:
        _update_nivel(user_id, puntos_ganados)

    db.session.commit()
    return jsonify([r.to_dict() for r in results])


@courses_bp.get('/my-courses')
@require_auth
def my_courses():
    inscripciones = (
        Inscripcion.query
        .filter_by(usuario_id=g.current_user.id, activa=True)
        .all()
    )
    return jsonify([i.curso.to_dict() for i in inscripciones if i.curso])
