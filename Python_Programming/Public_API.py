from requests import get
from time import sleep
base_url = "https://pokeapi.co/api/v2/type/"
characters = []

for i in range (1,6):
    api_url = base_url + str(i)
    response = get(api_url)
    response_js = response.json()
    id = response_js["id"]
    generation = response_js["generation"]["name"]
    pokemon = response_js["pokemon"][1]["pokemon"]["name"]
    result = [id, generation, pokemon]
    characters.append(result)
    sleep(2) # break 2second

print(characters)
