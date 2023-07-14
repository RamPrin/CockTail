import numpy as np
import pandas as pd
import re
from concurrent.futures import ThreadPoolExecutor

from model.generator.reciper import query
from model.generator.infer import query_image

def recipe_generate(components):
    print('Start generating...')
    request = query(components)
    start = -1
    for i in range(len(request)):
        if request[i].isnumeric():
            start = i
            break
    recipe = request[:start]
    ingredients = request[start:]
    ingredients = ingredients.split(" ")
    comp_ind = 0
    ing_ind = 0
    response = {
        "name": "#1",
        "ingredients":[],
        "recipe": recipe
    }

    while ing_ind < len(ingredients) and comp_ind < len(components):
        if ingredients[ing_ind][0].isnumeric():
            if re.match(r'[0-9]+\.*[0-9]*$', ingredients[ing_ind]):
                response['ingredients'].append(
                    {
                        'amount': ingredients[ing_ind],
                        'measure': ingredients[ing_ind+1],
                        'name': components[comp_ind]
                    }
                )
            else:
                am = ''
                meas = ''
                for i in range(len(ingredients[ing_ind])):
                    if not ingredients[ing_ind][i].isnumeric():
                        am = ingredients[ing_ind][:i]
                        meas = ingredients[ing_ind][i:]
                        break
                response['ingredients'].append(
                    {
                        'amount': am,
                        'measure': meas,
                        'name': components[comp_ind]
                    }
                )
            comp_ind += 1
            ing_ind += 2
        else:
            ing_ind += 1
    return response

def ingredients_from_recipe(components):
    with ThreadPoolExecutor() as exec:
        recipe = exec.submit(recipe_generate, (components))
        img = exec.submit(query_image, (components))
        exec.shutdown(wait=True, cancel_futures=True)
        response = recipe.result()
        response['img'] = img.result()
        return response

class Cocktail():
    def __init__(self, size, ingredients) -> None:
        self.cocktail = ingredients
        self.size = size
    
    def new_ingredient(self, ingredient):
        self.cocktail.append(ingredient)        

    def get_cur_size(self):
        return len(self.cocktail)
    
    def cocktail_components(self):
        return self.cocktail
    
    def is_finished(self):
        if len(self.cocktail) == self.size:
            return True
        else: return False

    def __str__(self):
        return f'{self.cocktail}'
    
    def __repr__(self) -> str:
        return self.__str__()
    
class ImpruvedCocktailGenerator():
    def __init__(self, table, len_prob) -> None:
        self.prob_table = pd.read_csv(table, index_col=0)
        self.cocktail = Cocktail(0,[])
        len_and_probs = pd.read_csv(len_prob, index_col=0)
        self.len_and_probs = len_and_probs.sort_values(by='length', ascending=True)

    def main_ingredients(self, ingredients):
        cur_len = len(ingredients)

        lengths = self.len_and_probs.iloc[cur_len:, 0].to_list()
        probs = self.len_and_probs.iloc[cur_len:, 1].to_list()

        probs = np.array(probs) / sum(probs)
        size = np.random.choice(a=lengths, p=probs)

        self.cocktail = Cocktail(size, ingredients)
    
    def check_value(self, eps):
        value = np.random.uniform(low=0.0, high=1.0)
        if value >= eps:
            return True
        else: return False
    
    def prob_row(self):
        # Compute the conditional probobilities for next ingredients based on the existing ingredients
        cur_prob = np.ones(shape=(1, len(self.prob_table)))
        for i in range((self.cocktail).get_cur_size()):
            ing = self.cocktail.cocktail_components()[i]
            cur_prob = cur_prob * np.array(self.prob_table.loc[ing]).reshape(1, -1)
        return cur_prob[0]
    
    def softmax(self, x):
    # Compute softmax values for each sets of scores in x.
        return np.array(x) / sum(x)
    
    def select_next_ing(self):
    # Select the best next ingredient using softmax
        ingredients_probs = self.prob_row()
        best_indices = np.argpartition(ingredients_probs, -2)[-6:]
        best_probs = self.softmax(ingredients_probs[best_indices])
        favorite = np.random.choice(best_indices, p=best_probs)
        next_ing = self.prob_table.columns[favorite]
        return next_ing

    def eps_greedy(self, eps, exclude):
    # Epsilon Greedy algorithm to select next ingredient
        while True:
            if self.check_value(eps):
                next_ing = np.random.choice(self.prob_table.columns)
            else:
                next_ing = self.select_next_ing()
                
            if (not next_ing in self.cocktail.cocktail_components()) and (not next_ing in exclude):
                break

        return next_ing
    
    def launch(self, include, exclude):
        self.main_ingredients(include)
        while not self.cocktail.is_finished():
            next_ingredient = self.eps_greedy(0.93, exclude)
            self.cocktail.new_ingredient(next_ingredient)
        try:
            return ingredients_from_recipe(self.cocktail.cocktail_components())
        except Exception as e:
            print('mixup.py',e)
            return {
                "name": "#1",
                "ingredients":[
                    {
                        "amount": '0',
                        "measure": "cl", 
                        "name": name
                    } for name in self.cocktail.cocktail_components()
                ],
                "recipe": "SHAKE all the ingredients."
            }

    def ingredients(self):
        return self.prob_table.columns.to_list()