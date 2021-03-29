import random
print("가위 바위 보 게임입니다.\n가위, 바위, 보 중에서 입력하세요.")
computer = random.choice(["가위","바위","보"])
user = input("사용자 >> ")
print("컴퓨터 >> " + computer)
if user == computer:
    print("비겼습니다.")
elif user == "가위" and computer == "바위":
    print("졌습니다.")
elif user == "가위" and computer == "보":
    print("이겼습니다.")
elif user == "바위" and computer == "보":
    print("졌습니다.")
elif user == "바위" and computer == "가위":
    print("이겼습니다.")
elif user == "보" and computer == "가위":
    print("졌습니다.")
else:
    print("이겼습니다.")
