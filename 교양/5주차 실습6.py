import random

num1 = random.randrange(10,99)
num2 = random.randrange(10,99)
result = num1+num2

problem = str(num1) + '+' + str(num2) + '='

print("두 자릿수 덧셈 문제를 풀어봅시다.")
sum = int(input(problem))

if sum == result:
    print("맞았습니다.")
else:
    print("틀렸습니다. 정답은", result,"입니다.")
