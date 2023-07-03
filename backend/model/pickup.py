from scipy import spatial
import pandas as pd

def init(table: str):
  global df, cocktail_list
  df = pd.read_csv(table, index_col=0)
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
    st = df.iloc[id, [0,5]].to_list()
    recipe = st[1].replace("[", "").replace("]", "").replace("'", "").split(", ")
    print(recipe)
    result.append(
        {
          'name': st[0],
          'recipe':[
              {
                  'amount': recipe[i],
                  'measure': 'cl',
                  'name': recipe[i+1]
              } for i in range(0, len(recipe), 2)
          ]
        }
    )
  return result