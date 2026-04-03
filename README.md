# DiplomaticU — Backend API

API REST en Flask para la plataforma de preparación al Servicio Exterior Mexicano.

## Stack

- **Python 3.13** + Flask 3.x
- **PostgreSQL 14** (SQLAlchemy + Flask-Migrate)
- **JWT** (PyJWT) para autenticación
- **pytest** para tests

## Setup local

### 1. Requisitos previos

```bash
brew install postgresql@14
brew services start postgresql@14
```

### 2. Clonar e instalar dependencias

```bash
git clone <repo>
cd diplomaticu-backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
```

### 3. Configurar variables de entorno

```bash
cp .env.example .env
# Editar .env con tus valores
```

| Variable | Descripción | Ejemplo |
|---|---|---|
| `DATABASE_URL` | Conexión a PostgreSQL | `postgresql://user@localhost:5432/diplomaticu` |
| `JWT_SECRET_KEY` | Clave para firmar tokens JWT | cadena aleatoria larga |
| `SECRET_KEY` | Clave de Flask | cadena aleatoria larga |
| `FRONTEND_URL` | URL del frontend (CORS) | `http://localhost:5173` |

### 4. Crear DB y correr migraciones

```bash
psql -U <user> -d postgres -c "CREATE DATABASE diplomaticu;"
flask db upgrade
```

### 5. Cargar datos iniciales

```bash
psql -U <user> -d diplomaticu -f seed.sql
psql -U <user> -d diplomaticu -f seed_preguntas_adicionales.sql
```

### 6. Levantar el servidor

```bash
python run.py
# http://localhost:5001
```

> El puerto 5000 está ocupado por AirPlay en macOS, se usa 5001.

---

## Tests

```bash
# Crear DB de test (solo la primera vez)
psql -U <user> -d postgres -c "CREATE DATABASE diplomaticu_test;"

python -m pytest tests/ -v
```

---

## Endpoints

### Auth

| Método | Ruta | Auth |
|---|---|---|
| POST | `/auth/register` | No |
| POST | `/auth/login` | No |
| GET | `/auth/verify` | Sí |

Campos de registro: `email`, `password`, `first_name`, `last_name` + opcionales de perfil.

### Cursos

| Método | Ruta | Auth |
|---|---|---|
| GET | `/courses/` | No |
| GET | `/courses/<id>` | No |
| POST | `/courses/<id>/enroll` | Sí |
| GET | `/courses/<id>/topics` | No |
| GET | `/courses/topics/<leccion>/questions` | No |
| POST | `/courses/questions/<id>/answer` | Sí |
| POST | `/courses/questions/bulk-answer` | Sí |
| GET | `/courses/my-courses` | Sí |

Respuesta de `/answer` incluye `es_correcta`, `respuesta_correcta`, `explicacion` y snapshot de `progreso`.

### Usuarios

| Método | Ruta | Auth |
|---|---|---|
| GET | `/users/profile` | Sí |
| PUT | `/users/profile` | Sí |
| POST | `/users/change-password` | Sí |
| GET | `/users/progress` | Sí |
| GET | `/users/achievements` | Sí |
| GET | `/users/gamification` | Sí |

---

## Gamificación

- **+10 puntos** por respuesta correcta
- **Racha** de días consecutivos de actividad
- **Nivel** = `puntos_totales // 100 + 1`