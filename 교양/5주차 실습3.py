import random

print("동전 던지기 실험을 시작합니다.")

count = 0

for x in range(1,11):
    frontback = random.randrange(2)
    if frontback==0:
        print(x,"차 시도 : 뒷면")
    else:
        print(x,"차 시도 : 앞면")
        count += 1

print("총 10번 던져서 앞면이 ",count,"번 나왔습니다.")
