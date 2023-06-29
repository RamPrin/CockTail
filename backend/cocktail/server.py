from contextlib import asynccontextmanager
from fastapi import FastAPI
from backend.cocktail.models import StartIngredient
from backend.data.dumper import dump_ingredients
from backend.model.mixup import recommend, initialize
import sqlite3 

@asynccontextmanager
async def lifespan(app: FastAPI):
    dump_ingredients('backend/data/files/ingredients.csv')
    global init_table
    init_table = initialize()
    yield

server = FastAPI(lifespan=lifespan)

@server.get("/mixup")
def get_ingredients():
    con = sqlite3.connect('backend/data/db.sqlite3')
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
    recipes = recommend(init_table, start.start)
    return{
        'recipes': recipes
    }
