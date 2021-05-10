'''
L = [35,23,19,15,81]

for x in L:
    prime = True
    for k in range(2,x):
        if x % k == 0:
            prime = False
            break
        if prime:
            print(x)
'''

def isPrime(num):
    for k in range(2,num):
        if num % k == 0:
            return False
    return True

L = [35,23,19,15,81]
for x in L:
    if isPrime(x)"
    print(x)
