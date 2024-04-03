from dog_api import app
from fastapi.testclient import TestClient

client = TestClient(app)

def test_can_reach_health_endpoint():
    response = client.get('/health')
    assert response.status_code == 200

def test_health_endpoint_returns_expected_msg():
    response = client.get('/health')
    assert response.text == '"woof"'

def test_can_reach_dog_endpoint(mocker):
    mocker.patch("dog_api.name_service", return_value="fuzzy-melon")
    response = client.get('/')
    assert response.status_code == 200
