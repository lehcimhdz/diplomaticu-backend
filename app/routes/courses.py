from flask import Blueprint, request, jsonify, g
from sqlalchemy import func
from app import db
from app.middleware.auth import require_auth
from app.models.course import Curso, Pregunta, Inscripcion, ProgresoUsuario, RespuestaUsuario

courses_bp = Blueprint('courses', __name__)


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

    existing = RespuestaUsuario.query.filter_by(
        id_pregunta=question_id, id_usuario=g.current_user.id
    ).first()

    if existing:
        existing.respuesta_usuario = answer
        existing.resultado = is_correct
        existing.tiempo_respuesta = time_spent
        db.session.commit()
        return jsonify(existing.to_dict())

    respuesta = RespuestaUsuario(
        id_pregunta=question_id,
        id_usuario=g.current_user.id,
        respuesta_usuario=answer,
        resultado=is_correct,
        tiempo_respuesta=time_spent,
    )
    db.session.add(respuesta)
    db.session.commit()
    return jsonify(respuesta.to_dict()), 201


@courses_bp.post('/questions/bulk-answer')
@require_auth
def bulk_answer():
    data = request.get_json()
    answers = data.get('answers', [])
    results = []
    for item in answers:
        question_id = item.get('id_pregunta')
        answer = item.get('respuesta_usuario')
        time_spent = item.get('tiempo_respuesta', 0)

        pregunta = Pregunta.query.get(question_id)
        if not pregunta:
            continue

        is_correct = pregunta.respuesta_correcta == answer
        existing = RespuestaUsuario.query.filter_by(
            id_pregunta=question_id, id_usuario=g.current_user.id
        ).first()

        if existing:
            existing.respuesta_usuario = answer
            existing.resultado = is_correct
            existing.tiempo_respuesta = time_spent
            results.append(existing)
        else:
            respuesta = RespuestaUsuario(
                id_pregunta=question_id,
                id_usuario=g.current_user.id,
                respuesta_usuario=answer,
                resultado=is_correct,
                tiempo_respuesta=time_spent,
            )
            db.session.add(respuesta)
            results.append(respuesta)

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
