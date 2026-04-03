class TestCoursesList:
    def test_get_courses(self, client, seed_course):
        resp = client.get('/courses/')
        assert resp.status_code == 200
        assert isinstance(resp.get_json(), list)
        assert len(resp.get_json()) >= 1

    def test_get_course_detail(self, client, seed_course):
        curso_id = seed_course['curso_id']
        resp = client.get(f'/courses/{curso_id}')
        assert resp.status_code == 200
        assert resp.get_json()['id_curso'] == curso_id

    def test_get_course_not_found(self, client):
        resp = client.get('/courses/99999')
        assert resp.status_code == 404


class TestEnroll:
    def test_enroll_success(self, client, auth_headers, seed_course):
        resp = client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        assert resp.status_code == 201
        assert resp.get_json()['curso_id'] == seed_course['curso_id']

    def test_enroll_twice_returns_200(self, client, auth_headers, seed_course):
        client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        resp = client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        assert resp.status_code == 200

    def test_enroll_requires_auth(self, client, seed_course):
        resp = client.post(f'/courses/{seed_course["curso_id"]}/enroll')
        assert resp.status_code == 401


class TestTopicsAndQuestions:
    def test_get_topics(self, client, seed_course):
        curso_id = seed_course['curso_id']
        resp = client.get(f'/courses/{curso_id}/topics')
        assert resp.status_code == 200
        topics = resp.get_json()
        assert len(topics) == 1
        assert topics[0]['id_tema'] == 1

    def test_get_questions(self, client, seed_course):
        resp = client.get('/courses/topics/1/questions')
        assert resp.status_code == 200
        preguntas = resp.get_json()
        assert len(preguntas) >= 1
        # La respuesta correcta no se expone al cliente
        assert 'respuesta_correcta' not in preguntas[0]


class TestAnswerQuestion:
    def test_correct_answer(self, client, auth_headers, seed_course):
        # Primero inscribirse
        client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        pregunta_id = seed_course['pregunta_id']

        resp = client.post(
            f'/courses/questions/{pregunta_id}/answer',
            json={'answer': 'A', 'time_spent': 5},
            headers=auth_headers,
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert data['es_correcta'] is True
        assert data['respuesta_correcta'] == 'A'
        assert data['progreso']['preguntas_respondidas'] == 1
        assert data['progreso']['preguntas_correctas'] == 1

    def test_wrong_answer(self, client, auth_headers, seed_course):
        client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        pregunta_id = seed_course['pregunta_id']

        resp = client.post(
            f'/courses/questions/{pregunta_id}/answer',
            json={'answer': 'B', 'time_spent': 5},
            headers=auth_headers,
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert data['es_correcta'] is False
        assert data['respuesta_correcta'] == 'A'
        assert data['progreso']['preguntas_correctas'] == 0

    def test_answer_updates_progress(self, client, auth_headers, seed_course):
        client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        pregunta_id = seed_course['pregunta_id']

        client.post(
            f'/courses/questions/{pregunta_id}/answer',
            json={'answer': 'A'},
            headers=auth_headers,
        )
        resp = client.get('/users/progress', headers=auth_headers)
        progreso = resp.get_json()
        assert len(progreso) == 1
        assert progreso[0]['preguntas_respondidas'] == 1
        assert progreso[0]['preguntas_correctas'] == 1

    def test_answer_missing_field(self, client, auth_headers, seed_course):
        pregunta_id = seed_course['pregunta_id']
        resp = client.post(
            f'/courses/questions/{pregunta_id}/answer',
            json={},
            headers=auth_headers,
        )
        assert resp.status_code == 400

    def test_answer_requires_auth(self, client, seed_course):
        resp = client.post(
            f'/courses/questions/{seed_course["pregunta_id"]}/answer',
            json={'answer': 'A'},
        )
        assert resp.status_code == 401
