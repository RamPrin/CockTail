from fastapi.testclient import TestClient
from cocktail.server import server

def test_ingredients():
    with TestClient(server) as client:
        response = client.get('/mixup')
        assert response.status_code == 200
        ings = response.json()
        assert len(ings['ingredients']) > 0 

def test_mixup():
    with TestClient(server) as client:
        response = client.post('/mixup/result', json={
                    "include": [
                        "pineapple"
                    ],
                    "exclude": []
        })
        assert response.status_code == 200
        
def test_empty_mixup():
    with TestClient(server) as client:
        response = client.post('/mixup/result', json={
                    "include": [],
                    "exclude": []
        })
        assert response.status_code == 200
    

def test_pickup():
    with TestClient(server) as client:
        data = {
            "sweet": 0,
            "sour": 0,
            "savory": 0,
            "bitter": 0,
            "cream": False,
            "spicy": False,
            "fruity": False,
            "alcohol_free": False,
            "min_alc": 0,
            "max_alc": 0
            }
        response = client.post('/pickup/result', json=data)
        assert response.status_code == 200