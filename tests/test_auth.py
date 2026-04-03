class TestRegister:
    def test_register_success(self, client):
        resp = client.post('/auth/register', json={
            'email': 'nuevo@example.com',
            'password': 'Test1234!',
            'first_name': 'Juan',
            'last_name': 'Pérez',
        })
        assert resp.status_code == 201
        data = resp.get_json()
        assert 'token' in data
        assert data['user']['email'] == 'nuevo@example.com'

    def test_register_missing_fields(self, client):
        resp = client.post('/auth/register', json={'email': 'x@x.com'})
        assert resp.status_code == 400

    def test_register_duplicate_email(self, client):
        payload = {
            'email': 'dup@example.com',
            'password': 'Test1234!',
            'first_name': 'A',
            'last_name': 'B',
        }
        client.post('/auth/register', json=payload)
        resp = client.post('/auth/register', json=payload)
        assert resp.status_code == 409


class TestLogin:
    def test_login_success(self, client):
        client.post('/auth/register', json={
            'email': 'login@example.com',
            'password': 'Test1234!',
            'first_name': 'A',
            'last_name': 'B',
        })
        resp = client.post('/auth/login', json={
            'email': 'login@example.com',
            'password': 'Test1234!',
        })
        assert resp.status_code == 200
        assert 'token' in resp.get_json()

    def test_login_wrong_password(self, client):
        client.post('/auth/register', json={
            'email': 'wrong@example.com',
            'password': 'Test1234!',
            'first_name': 'A',
            'last_name': 'B',
        })
        resp = client.post('/auth/login', json={
            'email': 'wrong@example.com',
            'password': 'WrongPass!',
        })
        assert resp.status_code == 401

    def test_login_nonexistent_user(self, client):
        resp = client.post('/auth/login', json={
            'email': 'noexiste@example.com',
            'password': 'Test1234!',
        })
        assert resp.status_code == 401


class TestVerify:
    def test_verify_valid_token(self, client, auth_headers):
        resp = client.get('/auth/verify', headers=auth_headers)
        assert resp.status_code == 200
        assert resp.get_json()['user']['email'] == 'test@example.com'

    def test_verify_no_token(self, client):
        resp = client.get('/auth/verify')
        assert resp.status_code == 401

    def test_verify_invalid_token(self, client):
        resp = client.get('/auth/verify', headers={'Authorization': 'Bearer token.falso.aqui'})
        assert resp.status_code == 401
