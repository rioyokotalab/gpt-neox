import json


with open('sample_output.txt', 'r', encoding='utf-8') as f:
    for line in f:
        data = json.loads(line)
        print(data)

