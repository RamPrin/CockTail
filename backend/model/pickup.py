import pandas as pd
from scipy import spatial

def init_pickup(table: str, top: str):
  global df, cocktail_list, topper
  df = pd.read_csv(table, index_col=0)
  topper = pd.read_csv(top, index_col=0)
  cocktail_list = []
  for i in range(len(df['title'])):
    cocktail_list.append(Cocktail(df['cocktail_strength'][i],
                                  df['sweet_t'][i], df['sour_t'][i], df['savory_t'][i], df['bitter_t'][i],
                                  df['cream_t'][i], df['spicy_t'][i], df['fruity_t'][i], i))

class Cocktail:
  def __init__(self, alcolvl_, sweet_, sour_, savory_, bitter_, cream_, spicy_, fruity_, num):
    self.alcolvl = alcolvl_
    self.taste = [sweet_, sour_, savory_, bitter_, cream_, spicy_, fruity_]
    self.row = num
  
  def check_alco(self, min_lvl, max_lvl):
    return (min_lvl <= self.alcolvl <= max_lvl)

def split_ingredients(st):
  lst = eval(st)
  print(lst)
  recipe = []
  for l in lst:
    tmp = l[0].split(" ")
    tmp.append(l[1])
    print(tmp)
    recipe.append(tmp.copy())
  return recipe


def main_pick_cocktail(alcohol_free_button,
                       min_alc, max_alc,
                       sweet_inp, sour_inp, savory_inp, bitter_inp,
                       cream_button, spicy_button, fruity_button):

  user_taste = [sweet_inp, sour_inp, savory_inp, bitter_inp, cream_button, spicy_button, fruity_button]
  if (alcohol_free_button):
    min_alc = 0.0
    max_alc = 0.0

  variation_list = []
  for i in cocktail_list:
    if (i.check_alco(min_alc, max_alc)):
      variation_list.append([i.taste, i.row])
  if (len(variation_list) == 0):
    return -1

  variation_list.sort(key= lambda x : spatial.distance.cosine(user_taste, x[0]))

  ids = []
  for i in variation_list[:10]:
    ids.append(i[1])
  result = []

  for id in ids:
    st = df.iloc[id, [0,5,3,2]].to_list()
    recipe = split_ingredients(st[1])
    print(recipe)
    result.append(
        {
          'name': st[0],
          'ingredients':[
              {
                  'amount': ing[0],
                  'measure': ing[1],
                  'name': ing[2]
              } for ing in recipe
          ],
          "recipe": f'Recipe: {st[2]}\nGarnish: {st[3]}'
        }
    )
  return result

def top():
  result = {
    'cocktails': []
  }
  for i in range(len(topper)):
    st = topper.iloc[i, [0,5,3,2,6]].to_list()
    recipe = split_ingredients(st[1])    
    result['cocktails'].append(
       {
        'name': st[0],
        'ingredients':[
          {
              'amount': ing[0],
              'measure': ing[1],
              'name': ing[2]
          } for ing in recipe
        ],
        'recipe': f'Recipe: {st[2]}\nGarnish: {st[3]}',
        'img': st[4]
      }
    )
  return result