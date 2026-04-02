from functools import wraps
from flask import request, jsonify, current_app, g
import jwt
from app.models.user import User


def require_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth_header = request.headers.get('Authorization', '')
        if not auth_header.startswith('Bearer '):
            return jsonify({'error': 'Token requerido'}), 401

        token = auth_header.split(' ', 1)[1]
        try:
            payload = jwt.decode(
                token,
                current_app.config['JWT_SECRET_KEY'],
                algorithms=['HS256']
            )
        except jwt.ExpiredSignatureError:
            return jsonify({'error': 'Token expirado'}), 401
        except jwt.InvalidTokenError:
            return jsonify({'error': 'Token inválido'}), 401

        user = User.query.get(payload['sub'])
        if not user or not user.activo:
            return jsonify({'error': 'Usuario no encontrado'}), 401

        g.current_user = user
        return f(*args, **kwargs)

    return decorated
