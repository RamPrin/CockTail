import numpy as np
import pandas as pd

def initialize():
    return pd.read_csv('backend/data/files/probabilities_without_specials.csv', index_col=0)

def select_next_ing(init_ing, eps, table):
    value = np.random.uniform(low=0.0, high=1.0)
    if value >= eps:
        ings = []
        while len(ings) < 3:
            c_ing = np.random.choice(table.columns.to_list())
            if ings == init_ing or c_ing in ings:
                continue
            ings.append(c_ing)
        return ings
    else: 
        row = table.loc[init_ing].copy()
        row.sort_values(inplace=True, ascending=False)
        if row[0] == 1.0:
            return row.index[1:4].to_list()
        else: 
            return row.index[0:3].to_list()

def recommend(table: pd.DataFrame, start: str=''):
    recipes = [[start, i] for i in select_next_ing(start,1,table)]
    for recipe in recipes:
        while len(recipe) < 5:
            variants = select_next_ing(recipe[-1], 0.8, table)
            expired = True
            for v in variants:
                if v not in recipe:
                    recipe.append(v)
                    expired = False
                    break
            if expired:
                break
    return recipes
