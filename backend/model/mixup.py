import numpy as np
import pandas as pd
from sklearn.preprocessing import normalize

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
        return self.cocktail.cocktail_components()

    def ingredients(self):
        return self.prob_table.columns.to_list()
    


# class ImpruvedCocktailGenerator():
#     def __init__(self, table, cocktail_length) -> None:
#         self.prob_table = table
#         self.cocktail = Cocktail(cocktail_length)

#     def main_ingredients(self, ingredients):
#     # Append main ingredients
#         for ingredient in ingredients:
#             self.cocktail.new_ingredient(ingredient)

    
    
#     def check_value(self, eps):
#         value = np.random.uniform(low=0.0, high=1.0)
#         if value >= eps:
#             return True
#         else: return False
    
#     def prob_row(self):
#     # Compute the conditional probobilities for next ingredients based on the existing ingredients
#         cur_prob = np.ones(shape=(1, len(self.prob_table)))
#         for i in range((self.cocktail).get_cur_size()):
#             ing = self.cocktail.cocktail_components()[i]
#             cur_prob = cur_prob * np.array(self.prob_table.loc[ing]).reshape(1, -1)
#         return cur_prob[0]
    
#     def softmax(self, x):
#     # Compute softmax values for each sets of scores in x.
#         return np.array(x) / sum(x)
    
#     def select_next_ing(self):
#     # Select the best next ingredient using softmax
#         ingredients_probs = self.prob_row()
#         best_indices = np.argpartition(ingredients_probs, -2)[-6:]
#         best_probs = self.softmax(ingredients_probs[best_indices])
#         favorite = np.random.choice(best_indices, p=best_probs)
#         next_ing = self.prob_table.columns[favorite]
#         return next_ing

#     def eps_greedy(self, eps, exclude):
#     # Epsilon Greedy algorithm to select next ingredient
#         while True:
#             if self.check_value(eps):
#                 next_ing = np.random.choice(self.prob_table.columns)
#             else:
#                 next_ing = self.select_next_ing()
                
#             if (not next_ing in self.cocktail.cocktail_components()) and (not next_ing in exclude):
#                 break

#         return next_ing
    
#     def launch(self, include, exclude):
#         self.main_ingredients(include)
#         self.cocktail.set_size(include)
#         while not self.cocktail.is_finished():
#             next_ingredient = self.eps_greedy(0.93, exclude)
#             self.cocktail.new_ingredient(next_ingredient)
#         return self.cocktail