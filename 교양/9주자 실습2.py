ip = int(input("정수를 입력하세요 : "))
store = []

while ip > 0:
    mod_ip = ip % 10
    ip = ip // 10
    #store.append(mod_ip)
    store.insert(0,mod_ip)
    
print(store)
