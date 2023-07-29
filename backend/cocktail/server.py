from cocktail.models import StartMix, StartPick
from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse, Response
from fastapi.testclient import TestClient
from model.mixup import ImpruvedCocktailGenerator
from model.pickup import init_pickup, main_pick_cocktail, top, top_img



@asynccontextmanager
async def lifespan(app: FastAPI):
    global generator
    generator = ImpruvedCocktailGenerator('data/files/mixup.csv', 'data/files/len_probs.csv')
    init_pickup("data/files/pickup.csv", 'data/files/top10_data.csv')
    yield

server = FastAPI(lifespan=lifespan)

@server.get("/")
def root():
    return RedirectResponse(url='/docs')

server.add_middleware(
	CORSMiddleware,
	allow_origins="*",
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"]
)

@server.get("/mixup")
def get_ingredients():
    try:
        return {
            "ingredients": generator.ingredients()
        }
    except Exception as e:
        print(e)
        return {
            "ingredients": []
        }

@server.post("/mixup/result")
def mixup_res(start: StartMix):
    try:
        if len(start.include) == 0:
            start.include.append("apple")
        recipe = generator.launch(start.include, start.exclude)
        return recipe
    except Exception as e:
        print('server.py', e)
        return Response(status_code=500)

@server.post("/pickup/result")
def pickup_res(data:StartPick):
    try:
        result = main_pick_cocktail(data.alcohol_free, data.min_alc, data.max_alc, data.sweet, data.sour, data.savory, data.bitter, data.cream, data.spicy, data.fruity)
        return result
    except:
        return Response(status_code=500)

@server.get("/top")
def get_top():
    return top()

@server.get("/top/{img_id}")
def get_img(img_id: int):
    return top_img(img_id)


def test_ingredients():
    client = TestClient(server)
    response = client.get('/mixup')
    assert response.status_code == 200
    ings = response.json()
    print(ings['ingredients'])
    assert len(ings['ingredients']) > 0 