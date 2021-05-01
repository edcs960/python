import random

print("4자리 정수를 출력합니다.")

digits = []
digits.append(random.randrange(1,10))

for i in range(3):
    while True:
        m = random.randrange(10)
        if not m in digits:
            digits.append(m)
            break

for x in digits:
    print(x,end="")
