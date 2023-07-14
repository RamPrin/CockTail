import requests
import io
from PIL import Image

API_URL = "https://api-inference.huggingface.co/models/prompthero/openjourney"

def query(payload):
    response = requests.post(API_URL, json=payload)
    return response.content

try:
    image_bytes = query({
        "inputs": "one glass of cocktail on black background with grapefruit juice,lime juice,sugar syrup,angostura aromatic bitters",
    })

    image = Image.open(io.BytesIO(image_bytes))

    # Save the image to a file
    image.save('output_image.png')

except requests.HTTPError as http_err:
    print(f'HTTP error occurred: {http_err}') 
except Exception as err:
    print(f'An error occurred: {err}')
