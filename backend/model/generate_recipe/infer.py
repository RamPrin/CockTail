from transformers import T5Tokenizer, T5ForConditionalGeneration

tokenizer = T5Tokenizer.from_pretrained("yarika/cocktail_maker")
model = T5ForConditionalGeneration.from_pretrained("yarika/cocktail_maker")

input_text = "rutte old simon genever,lemon juice,raspberries,sugar syrup,orange juice,pineapple juice,luxardo maraschino liqueur,chilled water"
input_ids = tokenizer(input_text, return_tensors="pt").input_ids

outputs = model.generate(input_ids, max_new_tokens=100, num_beams=4)
print(tokenizer.decode(outputs[0]))