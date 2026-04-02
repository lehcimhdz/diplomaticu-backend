from flask import Blueprint, request, jsonify, g
from app import db
from app.middleware.auth import require_auth
from app.models.user import PerfilUsuario, LogroUsuario
from app.models.course import ProgresoUsuario

users_bp = Blueprint('users', __name__)


@users_bp.get('/profile')
@require_auth
def get_profile():
    user = g.current_user
    perfil = user.perfil
    return jsonify({
        **user.to_dict(),
        **(perfil.to_dict() if perfil else {}),
    })


@users_bp.put('/profile')
@require_auth
def update_profile():
    user = g.current_user
    data = request.get_json()

    # Update user fields
    for field in ('first_name', 'last_name'):
        if field in data:
            setattr(user, field, data[field])

    # Update perfil fields
    perfil_fields = [
        'telefono', 'fecha_nacimiento', 'pais', 'estado', 'ciudad',
        'nivel_educativo', 'universidad', 'carrera', 'objetivo_estudio',
        'tiempo_estudio_diario',
    ]
    if not user.perfil:
        user.perfil = PerfilUsuario(id=user.id)
    for field in perfil_fields:
        if field in data:
            setattr(user.perfil, field, data[field])

    db.session.commit()
    return jsonify({**user.to_dict(), **(user.perfil.to_dict() if user.perfil else {})})


@users_bp.get('/achievements')
@require_auth
def get_achievements():
    logros = LogroUsuario.query.filter_by(usuario_id=g.current_user.id).all()
    return jsonify([l.to_dict() for l in logros])


@users_bp.get('/progress')
@require_auth
def get_progress():
    progreso = ProgresoUsuario.query.filter_by(usuario_id=g.current_user.id).all()
    return jsonify([p.to_dict() for p in progreso])


@users_bp.get('/gamification')
@require_auth
def get_gamification():
    nivel = g.current_user.nivel
    return jsonify(nivel.to_dict() if nivel else {})
