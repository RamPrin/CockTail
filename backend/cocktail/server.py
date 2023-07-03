from contextlib import asynccontextmanager
from fastapi import FastAPI
from cocktail.models import StartMix, StartPick
from data.dumper import dump_ingredients
from model.mixup import Cocktail_Generator
from model.pickup import init, main_pick_cocktail
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
import sqlite3

@asynccontextmanager
async def lifespan(app: FastAPI):
    dump_ingredients('data/files/ingredients.csv')
    global generator
    generator = Cocktail_Generator('data/files/probabilities_without_specials.csv')
    init("data/files/pickup.csv")
    yield

server = FastAPI(lifespan=lifespan)

server.add_middleware(
	CORSMiddleware,
	allow_origins="*",
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"]
)

@server.get("/mixup")
def get_ingredients():
    con = sqlite3.connect('data/db.sqlite3')
    curs = con.cursor()
    res = curs.execute('SELECT name FROM Ingredients;').fetchall()
    res = [item for sublist in res for item in sublist]
    curs.close()
    con.close()
    return {
        "ingredients": res
    }

@server.get("/")
def root():
    return RedirectResponse(url="/docs")

@server.post("/mixup/result")
def mixup_res(start: StartMix):
    if len(start.include) == 0:
        start.include.append("apple")
       start.include.append("orange")
    generator.main_ingredient(start.include[0])
    recipes = generator.launch()
    result = {
        "cocktails":[]
    }
    for i in range(len(recipes)):
        result["cocktails"].append(
            {
            "name": f"#{i+1}",
            "ingredients": [
                {
                "amount": 0,
                "measure": "cl",
                "name": name
                } for name in recipes[i]
            ]
            }
        )
    return result

@server.post("/pickup/result")
def pickup_res(data:StartPick):
    result = main_pick_cocktail(data.alcohol_free, data.min_alc, data.max_alc, data.sweet, data.sour, data.savory, data.bitter, data.cream, data.spicy, data.fruity)
    return result
