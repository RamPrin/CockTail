import requests

API_URL = "https://api-inference.huggingface.co/models/yarika/cocktail_maker"

def query(payload):
	response = requests.post(API_URL, json=payload)
	return response.json()
	
output = query({
	"inputs": "rutte old simon genever,lemon juice,raspberries,sugar syrup,orange juice,pineapple juice,luxardo maraschino liqueur,chilled waters",
	"parameters": {"num_beams": 4, "max_length": 200},
})


print(output)