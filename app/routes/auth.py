from flask import Blueprint, request, jsonify, g
import bcrypt
from app import db
from app.models.user import User, PerfilUsuario, NivelUsuario
from app.middleware.auth import require_auth
from app.utils.jwt import generate_token

auth_bp = Blueprint('auth', __name__)


@auth_bp.post('/register')
def register():
    data = request.get_json()
    required = ['email', 'password', 'first_name', 'last_name']
    if not all(data.get(k) for k in required):
        return jsonify({'error': 'Faltan campos requeridos'}), 400

    if User.query.filter_by(email=data['email']).first():
        return jsonify({'error': 'El correo ya está registrado'}), 409

    password_hash = bcrypt.hashpw(data['password'].encode(), bcrypt.gensalt()).decode()

    user = User(
        email=data['email'],
        password_hash=password_hash,
        first_name=data['first_name'],
        last_name=data['last_name'],
    )
    db.session.add(user)
    db.session.flush()  # get user.id before commit

    perfil = PerfilUsuario(
        id=user.id,
        telefono=data.get('telefono'),
        pais=data.get('pais', 'México'),
        estado=data.get('estado'),
        ciudad=data.get('ciudad'),
        nivel_educativo=data.get('nivel_educativo'),
        universidad=data.get('universidad'),
        carrera=data.get('carrera'),
        objetivo_estudio=data.get('objetivo_estudio'),
    )
    nivel = NivelUsuario(usuario_id=user.id)
    db.session.add(perfil)
    db.session.add(nivel)
    db.session.commit()

    token = generate_token(user.id)
    return jsonify({'user': user.to_dict(), 'token': token, 'message': 'Registro exitoso.'}), 201


@auth_bp.post('/login')
def login():
    data = request.get_json()
    email = data.get('username') or data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({'error': 'Correo y contraseña requeridos'}), 400

    user = User.query.filter_by(email=email).first()
    if not user or not bcrypt.checkpw(password.encode(), user.password_hash.encode()):
        return jsonify({'error': 'Credenciales inválidas'}), 401

    if not user.activo:
        return jsonify({'error': 'Cuenta desactivada'}), 403

    token = generate_token(user.id)
    return jsonify({'user': user.to_dict(), 'token': token, 'message': 'Login exitoso.'})


@auth_bp.get('/verify')
@require_auth
def verify():
    return jsonify({'message': 'Token válido.', 'user': g.current_user.to_dict()})
