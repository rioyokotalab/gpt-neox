from transformers import T5Tokenizer

t = T5Tokenizer.from_pretrained("rinna/japanese-roberta-base")
t.save_pretrained('T5Tokenizer')
