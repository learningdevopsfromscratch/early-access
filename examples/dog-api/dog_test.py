from fastapi.testclient import TestClient
from dog_api import app

client = TestClient(app)

def test_can_reach_health_endpoint():
    response = client.get('/health')
    assert response.status_code == 200

def test_health_endpoint_returns_expected_msg():
    response = client.get('/health')
    assert response.text == '"woof"'

def test_can_reach_dog_endpoint():
    response = client.get('/')
    assert response.status_code == 200
