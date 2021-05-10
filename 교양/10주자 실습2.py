import random

def setProblem(no,op):
    num1 = random.randrange(10,100)
    num2 = random.randrange(10,100)
    str_tmp = "문제 " + str(no) + " : " + str(num1) + op + str(num2) + " = "

    if op == "+":
        answer = num1 + num2
    elif op == "-":
        answer = num1 - num2
    else:
        answer = num1 * num2

    result = int(input(str_tmp))
    if result == answer:
        print("맞았습니다.")
        return 1
    else:
        print("틀렸습니다. 정답은", answer,"입니다.")
        return 0
    
print("산수 문제를 풀어보세요")
num = int(input("몇 문제를 출제할까요:"))

count = 0

for no in range(1,num+1):
    print()
    op = random.choice(["+","-","*"])
    count += setProblem(no,op)

print()

print("맞춘 문제의 수는",count,"개입니다.")
print("정답비율은", int(100*count/num),"%입니다.")
