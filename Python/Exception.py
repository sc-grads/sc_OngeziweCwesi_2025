try:
    result: float = 10/0
    print(result)
except Exception as e:
    print(f'Error: {e}')


print('Done')