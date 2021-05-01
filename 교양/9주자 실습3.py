import random

lotto = []

for i in range(5):
    numbers = []
    numbers.append(random.randrange(1,46))
    for j in range(5):
        while True:
            num = random.randrange(1,46)
            if not num in numbers:
                numbers.append(num)
                break
    numbers.sort()
    lotto.append(numbers)

for i in range(5):
    for j in range(6):
        print(lotto[i][j], end=" ")
    print()
