from cocktail.models import StartMix, StartPick
from contextlib import asynccontextmanager
from data.dumper import dump_ingredients
from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from model.mixup import ImpruvedCocktailGenerator
from model.pickup import init_pickup, main_pick_cocktail
import sqlite3 

@asynccontextmanager
async def lifespan(app: FastAPI):
    dump_ingredients('data/files/ingredients.csv')
    global generator
    generator = ImpruvedCocktailGenerator('data/files/mixup.csv')
    init_pickup("data/files/pickup.csv")
    yield

server = FastAPI(lifespan=lifespan)

@server.get("/")
def root():
    return RedirectResponse(url='/docs')

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

@server.post("/mixup/result")
def mixup_res(start: StartMix):
    if len(start.include) == 0:
        start.include.append("apple")
    recipes = generator.launch(start.include, start.exclude)
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