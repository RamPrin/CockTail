from contextlib import asynccontextmanager
from fastapi import FastAPI
from cocktail.models import StartIngredient
from data.dumper import dump_ingredients
from model.mixup import recommend, Cocktail_Generator
from fastapi.middleware.cors import CORSMiddleware
import sqlite3

@asynccontextmanager
async def lifespan(app: FastAPI):
    dump_ingredients('data/files/ingredients.csv')
    global generator
    generator = Cocktail_Generator('data/files/probabilities_without_specials.csv')
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
    return {
      'name': 'root'
    }

@server.post("/mixup/result")
def mixup_res(start: StartIngredient):
    generator.main_ingredient(start.start)
    recipes = generator.launch()
    return{
        'recipes': recipes
    }
