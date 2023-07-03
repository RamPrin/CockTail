import sqlite3
import pandas
from os import path

def dump_ingredients(path_to_csv:str|None=None, list_of_ingredients:list=[]):
    print('dumping ingredients...')
    if not path.exists('data/db.sqlite3'):
        con = sqlite3.connect('data/db.sqlite3')
        curs = con.cursor()

        curs.execute("DROP TABLE IF EXISTS Ingredients")
        curs.execute("CREATE TABLE IF NOT EXISTS Ingredients( id INTEGER PRIMARY KEY NOT NULL, name VARCHAR(100) NOT NULL)")

        con.commit()

        if path_to_csv is not None:
            data = pandas.read_csv(path_to_csv)
            data = data.iloc[:,0].to_list()
        else:
            data = list_of_ingredients

        for d in data:
            curs.execute(f"INSERT INTO Ingredients (name) VALUES ('{d}')")
        con.commit()
        curs.close()
        con.close()
        print('Dumping done')
