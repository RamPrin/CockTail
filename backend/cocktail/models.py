from pydantic import BaseModel

class StartIngredient(BaseModel):
    start: str = 'pineapple'