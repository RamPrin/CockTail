from pydantic import BaseModel

class StartMix(BaseModel):
    include: list = ['pineapple']
    exclude: list = []

class StartPick(BaseModel):
    sweet: int|float = 0
    sour: int|float = 0
    savory: int|float = 0
    bitter: int|float = 0
    cream: bool = False
    spicy: bool = False
    fruity: bool = False
    alcohol_free: bool = False
    min_alc: int|float = 0
    max_alc: int|float = 0
