p = []
with open('problem.txt','r') as file:
    for line in file:
        temp = ''
        for char in line:
            if char.isdigit():
                temp += char
        if temp:
            p.append(temp)

pp = []
for element in p:
    element = element[0]+element[len(element)-1]
    pp.append(int(element)) 

sol = 0
for element in pp:
    sol += element

print(sol)
