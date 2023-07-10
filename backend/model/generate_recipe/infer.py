from transformers import T5Tokenizer, T5ForConditionalGeneration

tokenizer = T5Tokenizer.from_pretrained("modellll")
model = T5ForConditionalGeneration.from_pretrained('modellll')

inp = "rutte old simon genever,lemon juice,raspberries,sugar syrup,orange juice,pineapple juice,luxardo maraschino liqueur,chilled water"
tokens = tokenizer(inp, return_tensors="pt")["input_ids"]

result = model.generate(tokens, max_new_tokens=100, num_beams=4)

print(tokenizer.decode(result[0], skip_special_tokens=True))
