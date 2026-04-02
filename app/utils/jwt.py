from datetime import datetime, timedelta, timezone
import jwt
from flask import current_app


def generate_token(user_id: str, expires_in_hours: int = 24) -> str:
    payload = {
        'sub': str(user_id),
        'iat': datetime.now(timezone.utc),
        'exp': datetime.now(timezone.utc) + timedelta(hours=expires_in_hours),
    }
    return jwt.encode(payload, current_app.config['JWT_SECRET_KEY'], algorithm='HS256')
