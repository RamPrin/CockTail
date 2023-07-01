import numpy as np
import pandas as pd

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
    

class Cocktail_Generator():
    def __init__(self, table:pd.DataFrame|str) -> None:
        print('Generator init...')
        if isinstance(table, str):
            self.prob_table = pd.read_csv(table, index_col=0)
        else:
            self.prob_table = table
        self.cocktails = []
    
    def level_leaves(self, i):
        return max(4-(self.cocktails[i].get_cur_size()), 1)
    
    def main_ingredient(self, ingredient):
        if len(self.cocktails) != 0:
            self.cocktails = []
        for i in range(6):
            cocktail = Cocktail()
            cocktail.new_ingredient(ingredient)
            self.cocktails.append(cocktail)

    def check_value(self, eps):
        value = np.random.uniform(low=0.0, high=1.0)
        if value >= eps:
            return True
        else: return False
    
    def prob_row(self, branch):
        cur_prob = np.ones(shape=(1, len(self.prob_table)))
        for i in range((self.cocktails[branch]).get_cur_size()):
            ing = self.cocktails[branch].cocktail_components()[i]
            cur_prob = cur_prob * np.array(self.prob_table.loc[ing]).reshape(1, -1)

        return cur_prob[0]
    
    def select_next_ing(self, branch):
        probs = self.prob_row(branch)
        indices = np.argpartition(probs, -2)[-7:]
        collect_next_level = []
        i = -1
        leaves = 0
        level_leaves = self.level_leaves(branch)
        while leaves < level_leaves:
            if self.check_value(0.9):
                next_ing = np.random.choice(self.prob_table.columns)
            else:
                next_ing = self.prob_table.columns[indices[i]]
            if not next_ing in self.cocktails[branch].cocktail_components():
                collect_next_level.append(next_ing)
                leaves += 1
            i -= 1
        return collect_next_level
    
    def get_coctail(self, branch):
        return self.cocktails[branch].cocktail_components()
    
    def launch(self):
        next = self.select_next_ing(0)
        for i in range(0,6,2):
                self.cocktails[i].new_ingredient(next[i//2])
                self.cocktails[i+1].new_ingredient(next[i//2])
                sec_next = self.select_next_ing(i)
                self.cocktails[i].new_ingredient(sec_next[0])
                self.cocktails[i+1].new_ingredient(sec_next[1])
    
        for i in range(6):
            while not self.cocktails[i].is_finished():
                next = self.select_next_ing(i)[0]
                self.cocktails[i].new_ingredient(next)
        ret_val = []
        for c in self.cocktails:
            ret_val.append(c.cocktail)
        return ret_val
