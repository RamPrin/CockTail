import requests
from time import sleep

headers = {"Authorization": "Bearer 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"}
API_URL = "https://api-inference.huggingface.co/models/yarika/cocktail_maker"

def query(components):
	st = ''
	for i in range(len(components)-1):
		st += components[i] + ','
	st += components[-1]
	payload = {"inputs": st, "parameters": {"num_beams": 4, "max_length": 200}}
	while True:
		try:
			response = requests.post(API_URL, headers=headers, json=payload)
			recipe = response.json()
			return recipe[0]['generated_text']
		except Exception as e:
			print('reciper.py', recipe, e)
			sleep(3)
			continue