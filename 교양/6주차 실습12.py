import random

print("덧셈 문제를 풀어봅시다.")
pb = int(input("출제할 문제의 수를 입력하세요:"))
print()

x = 0
count = 0

while x<pb:
    num1 = random.randrange(10,100)
    num2 = random.randrange(10,100)
    answer = int(input("문제 " + str(x) + " : " + str(num1) + " + " + str(num2) + " = "))

    if answer == num1 + num2:
        count += 1
        print("맞았습니다.")
    else:
        print("틀렸습니다. 정답은", num1 + num2 ,"입니다.")

    x += 1
    print()

print("맞춘 문제의 수는", count, "개 입니다.")
print("정답 비율은 ", 100 * count / pb, "% 입니다.")
