people: list[str] = ['Bob', 'James','Tom']

print('Original: ', people)

#Append
people.append ('Jeremy')
print(people)

#Remove
people.remove ('Bob')
print(people)

#pop
people.pop()
print(people)

#Change
people[0] = 'Charlotte'
print(people)

#Insert
people.insert(1, 'Timothy')
print(people)

# Clear
people.clear()
print(people)