from fastapi.testclient import TestClient
from name_api import app

client = TestClient(app)

def test_can_reach_health_endpoint():
    response = client.get('/health')
    assert response.status_code == 200

def test_health_endpoint_returns_expected_msg():
    response = client.get('/health')
    assert response.text == '"healthy"'

def test_can_reach_name_endpoint():
    response = client.get('/')
    assert response.status_code == 200
