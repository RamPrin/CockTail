from pydantic import BaseModel

class StartMix(BaseModel):
    include: list = ['pineapple']
    exclude: list = []

class StartPick(BaseModel):
    sweet: float = 0
    sour: float = 0
    savory: float = 0
    bitter: float = 0
    cream: bool = False
    spicy: bool = False
    fruity: bool = False
    alcohol_free: bool = False
    min_alc: float = 0
    max_alc: float = 0
