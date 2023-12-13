import numpy as np


text = []
with open('problem.txt','r') as file:
    for line in file:
        for i in range(len(line)):
            # remover "Game x:"
            if (line[i] == ":"):
                text.append(line[i+1:])

gg = []
for line in text:
    ggl = []
    for game in line.split(";"):
        aset = []
        for set in game.split(","):
            aset.append(set.strip().split())
        ggl.append(aset)
    gg.append(ggl)

# gg:[game][set][dice][qnt:color]

"""
only 12 red cubes, 13 green cubes, and 14 blue cubes
"""

cases = ["red","green","blue"]
max_quant = [12,13,14]
failed = 0
correct_idx = []

for i in range(len(gg)): # game

    failed = 0
    for j in range(len(gg[i])): # set
        quant = [0,0,0]
        
        for k in range(len(gg[i][j])): # dice
            for c in range(len(cases)):
                if cases[c] in gg[i][j][k]:
                    quant[c] = int(gg[i][j][k][0])
                    
                    if quant[c] > max_quant[c]:
                        failed = 1;
    if (not failed):
        correct_idx.append(i+1)
        
acc = 0;
for id in correct_idx:
    acc += id

print(f"The sum of the IDs is {acc}")
