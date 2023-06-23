from contextlib import asynccontextmanager
from fastapi import FastAPI
from backend.DB.dumper import dump_ingredients
import sqlite3 

@asynccontextmanager
async def lifespan(app: FastAPI):
    dump_ingredients('/backend/DB/ingredients.csv')
    yield

server = FastAPI(lifespan=lifespan)

@server.get("/mixup")
def get_ingredients():
    con = sqlite3.connect('backend/DB/db.sqlite3')
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