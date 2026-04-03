class TestProfile:
    def test_get_profile(self, client, auth_headers):
        resp = client.get('/users/profile', headers=auth_headers)
        assert resp.status_code == 200
        data = resp.get_json()
        assert data['email'] == 'test@example.com'
        assert data['first_name'] == 'Test'

    def test_update_profile(self, client, auth_headers):
        resp = client.put('/users/profile', json={
            'first_name': 'Actualizado',
            'ciudad': 'Guadalajara',
        }, headers=auth_headers)
        assert resp.status_code == 200
        data = resp.get_json()
        assert data['first_name'] == 'Actualizado'
        assert data['ciudad'] == 'Guadalajara'

    def test_profile_requires_auth(self, client):
        resp = client.get('/users/profile')
        assert resp.status_code == 401


class TestChangePassword:
    def test_change_password_success(self, client, auth_headers):
        resp = client.post('/users/change-password', json={
            'password_actual': 'Test1234!',
            'password_nueva': 'NuevaClave99!',
        }, headers=auth_headers)
        assert resp.status_code == 200
        assert 'actualizada' in resp.get_json()['message']

    def test_change_password_wrong_current(self, client, auth_headers):
        resp = client.post('/users/change-password', json={
            'password_actual': 'Incorrecta123',
            'password_nueva': 'NuevaClave99!',
        }, headers=auth_headers)
        assert resp.status_code == 400

    def test_change_password_too_short(self, client, auth_headers):
        resp = client.post('/users/change-password', json={
            'password_actual': 'Test1234!',
            'password_nueva': 'corta',
        }, headers=auth_headers)
        assert resp.status_code == 400

    def test_change_password_missing_fields(self, client, auth_headers):
        resp = client.post('/users/change-password', json={
            'password_actual': 'Test1234!',
        }, headers=auth_headers)
        assert resp.status_code == 400

    def test_change_password_requires_auth(self, client):
        resp = client.post('/users/change-password', json={
            'password_actual': 'Test1234!',
            'password_nueva': 'NuevaClave99!',
        })
        assert resp.status_code == 401


class TestGamification:
    def test_get_gamification(self, client, auth_headers):
        resp = client.get('/users/gamification', headers=auth_headers)
        assert resp.status_code == 200
        data = resp.get_json()
        assert 'puntos_totales' in data
        assert data['puntos_totales'] == 0

    def test_gamification_updates_on_correct_answer(self, client, auth_headers, seed_course):
        client.post(f'/courses/{seed_course["curso_id"]}/enroll', headers=auth_headers)
        client.post(
            f'/courses/questions/{seed_course["pregunta_id"]}/answer',
            json={'answer': 'A'},
            headers=auth_headers,
        )
        resp = client.get('/users/gamification', headers=auth_headers)
        assert resp.get_json()['puntos_totales'] == 10
