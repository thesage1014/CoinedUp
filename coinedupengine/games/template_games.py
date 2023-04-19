import csv

from .arc_game import *

games_list = []

with open("./coinedupengine/games/template_games.csv", newline="") as csvfile:
    templatereader = csv.DictReader(csvfile, delimiter=",", quotechar="|")

    for row in templatereader:
        if row["name"] == "explanation":
            continue
        print("Loading ", row["name"])
        games_list.append(ArcGame(row))

print("Loaded template games")
