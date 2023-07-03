import numpy as np
import pandas as pd

class Cocktail():
    def __init__(self) -> None:
        self.cocktail = []
        self.size = np.random.randint(3, 6)

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
    def __init__(self, table) -> None:
        self.prob_table = pd.read_csv(table, index_col=0)
        self.cocktail = Cocktail()

    def main_ingredients(self, ingredients):
    # Append main ingredients
        for ing in ingredients:
            self.cocktail.new_ingredient(ing)
    
    def check_value(self, eps):
        value = np.random.uniform(low=0.0, high=1.0)
        if value >= eps:
            return True
        else: return False
    
    def prob_row(self):
    # Compute the conditional probabilities for next ingredients based on the existing ingredients
        cur_prob = np.ones(shape=(1, len(self.prob_table)))
        for i in range((self.cocktail).get_cur_size()):
            ing = self.cocktail.cocktail_components()[i]
            cur_prob = cur_prob * np.array(self.prob_table.loc[ing]).reshape(1, -1)
        return cur_prob[0]
    
    def softmax(self, x):
    # Compute softmax values for each sets of scores in x.
        return np.exp(x) / np.sum(np.exp(x), axis=0)
    
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
        if len(include) <= 3:
            self.main_ingredients(include)
            while not self.cocktail.is_finished():
                next_ingredient = self.eps_greedy(0.93, exclude)
                self.cocktail.new_ingredient(next_ingredient)
        return self.cocktail.cocktail