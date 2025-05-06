def add(*args: int)-> int:
    print(args)
    return sum(args)

print(add(1,2,3))


def greet(greeting: str, *people: str, ending: str) -> None:
    for person in people:
        print(f'{greeting},{person}{ending}')

greet('Hello','Bob','James','Maria', ending='!')


# **kwargs

def pin_position(**kwargs: int) -> None:
    print(kwargs)

pin_position(x=10, y=20)
