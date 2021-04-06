import random

print("1부터 100사이의 숫자를 7번 만에 맞춰 보세요.")
num = random.randrange(1,101)
success = False

for x in range(7):
    ip = int(input(str(x+1) + "차 시도 : "))
    if ip < num:
        print('낮아요')
    elif ip > num:
        print('높아요')
    else:
        success = True
        print('축하합니다.', str(x+1) + '번 만에 맞추었네요')
        break;

if success == False:
    print('아쉽네요. 정답은', num, '입니다.')

