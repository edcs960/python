kg = int(input("몸무게를 kg 단위로 입력하시오 : "))
height = int(input("키를 센티미터 단위로 입력하시오 : "))

mheight = height/100

bmi = kg / (mheight*mheight)

print("당신의 BMI = ", bmi)
