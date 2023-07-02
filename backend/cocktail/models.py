from pydantic import BaseModel

class StartMix(BaseModel):
    include: list = ['pineapple']
    exclude: list = []
