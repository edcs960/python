sum = 0
t_f = True

while t_f:
    n = float(input("숫자를 입력하시오 :"))
    p_t_f = input("입력을 계속하려면 y를 입력하세요")
    sum += n
    if p_t_f == "n":
        t_f = False
print(sum)
    
