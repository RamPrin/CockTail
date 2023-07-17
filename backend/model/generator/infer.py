import base64
import io
import requests
from PIL import Image

headers = {"Authorization": "Bearer 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"}
API_URL = "https://api-inference.huggingface.co/models/prompthero/openjourney"

def query(payload):
    response = requests.post(API_URL, headers=headers, json=payload)
    return response.content


def query_image(ingredients):
    while True:
        try:
            ing_st = str(ingredients[0])
            for i in range(1, len(ingredients)):
                ing_st += f',{ingredients[i]}'
            image_bytes = query({
                "inputs": "one glass of cocktail on black background with " + ing_st + ".Size 512x512",
            })
            img = Image.open(io.BytesIO(image_bytes))
            img.resize((512,512))
            buffer = io.BytesIO()
            img.save(buffer, format='PNG')
            return base64.b64encode(buffer.getvalue())
        except requests.HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}') 
        except Exception as err:
            print(f'An error occurred: {err}')
