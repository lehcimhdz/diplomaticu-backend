import pytest
from app import create_app, db as _db


@pytest.fixture(scope='session')
def app():
    application = create_app()
    application.config.update({
        'TESTING': True,
        'SQLALCHEMY_DATABASE_URI': 'postgresql://michelcano@localhost:5432/diplomaticu_test',
        'JWT_SECRET_KEY': 'test-jwt-secret',
    })
    with application.app_context():
        _db.create_all()
        yield application
        _db.drop_all()


@pytest.fixture(autouse=True)
def clean_db(app):
    """Limpia todas las tablas entre tests."""
    yield
    with app.app_context():
        for table in reversed(_db.metadata.sorted_tables):
            _db.session.execute(table.delete())
        _db.session.commit()


@pytest.fixture
def client(app):
    return app.test_client()


@pytest.fixture
def auth_headers(client):
    """Registra un usuario de prueba y retorna los headers con JWT."""
    resp = client.post('/auth/register', json={
        'email': 'test@example.com',
        'password': 'Test1234!',
        'first_name': 'Test',
        'last_name': 'User',
    })
    token = resp.get_json()['token']
    return {'Authorization': f'Bearer {token}'}


@pytest.fixture
def seed_course(app, client):
    """Inserta un curso y una pregunta de prueba."""
    from app.models.course import Curso, Pregunta
    with app.app_context():
        curso = Curso(
            nombre_curso='Curso Test',
            descripcion_curso='Descripción test',
            gratuito=True,
            duracion_horas=10,
            activo=True,
        )
        _db.session.add(curso)
        _db.session.flush()

        pregunta = Pregunta(
            id_curso=curso.id_curso,
            leccion=1,
            planteamiento='Tema test',
            pregunta='¿Pregunta de prueba?',
            opciones={'A': 'Opción A', 'B': 'Opción B', 'C': 'Opción C', 'D': 'Opción D'},
            respuesta_correcta='A',
            explicacion='La respuesta es A.',
            activa=True,
        )
        _db.session.add(pregunta)
        _db.session.commit()
        return {'curso_id': curso.id_curso, 'pregunta_id': pregunta.id_pregunta}
