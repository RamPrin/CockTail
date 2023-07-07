from cocktail.models import StartMix, StartPick
from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from model.mixup import ImpruvedCocktailGenerator
from model.pickup import init_pickup, main_pick_cocktail, top
import sqlite3 

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
        recipes = generator.launch(start.include, start.exclude)
        result = {
                "name": f"#1",
                "ingredients": [
                    {
                    "amount": 0,
                    "measure": "cl",
                    "name": name
                    } for name in recipes
                ],
                "recipe": "SHAKE-SHAKE"
        }
        return result
    except Exception as e:
        print(e)
        return {
                "name": "NDA",
                "ingredients": [
                        {
                            "amount": 0,
                            "measure": "NDA",
                            "name": "NDA"
                        }
                ],
                "recipe": "NDA"
        }

@server.post("/pickup/result")
def pickup_res(data:StartPick):
    result = main_pick_cocktail(data.alcohol_free, data.min_alc, data.max_alc, data.sweet, data.sour, data.savory, data.bitter, data.cream, data.spicy, data.fruity)
    return {
        "cocktails":result
    }

@server.get("/top")
def get_top():
    return top()
