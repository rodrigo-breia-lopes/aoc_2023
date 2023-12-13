digit_dict = {
        'one'   : "1", 
        'two'   : "2",
        'three' : "3",
        'four'  : "4",
        'five'  : "5",
        'six'   : "6",
        'seven' : "7",
        'eight' : "8",
        'nine'  : "9"
        }

digits = ["zero","one","two","three","four","five","six","seven","eight","nine"]
p = []

with open('problem2.txt','r') as file:
    for line in file:
        temp = ''
        for i in range(len(line)):
            if line[i].isdigit():
                temp += line[i]
            else:
                for dig in digits:
                    if line[i:].startswith(dig):
                        #print(dig)
                        #zz = digit_dict[f'{dig}']
                        #print(f'{zz}')
                        temp += digit_dict[f'{dig}']
        p.append(temp)

pp = []
for element in p:
    element = element[0]+element[len(element)-1]
    pp.append(int(element)) 

sol = 0
for element in pp:
    sol += element

print(sol)


            
"""
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
"""
