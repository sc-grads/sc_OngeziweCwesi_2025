from typing import Final

AUTHOR: Final[str] = 'Federico'
VESRION: Final[int] = 1


def greet(name: str) -> None:
    print(f'Hello, {name}!')