age: int = 20

if age >= 21:
    print('You may enter the club!')
else:
    print('You are not allowed in...')

    weather: str = 'cloudy'

    if weather == 'clear':
        print('It is a nice day!')
    elif weather == 'cloudy':
        print('The weather could be better...')
    elif weather == 'rainy':
        print('What an awful day!')
    else:
        print('Unknown weather')


#If...Else (Shorthand)

number: int = 10

if number > 0:
    result: str = 'Above 0'

else:
    result:str = '0 and below'

result: str = 'Above 0' if number >0 else ('0 and below')

print(result)
