# 문자열 분리

fruits = "apple, banana, orange,  pear"

print("공백을 기준으로 분리 (split)")
print(fruits.split())
print()
print("기준을 설정하여 분리 (괄호에서 기준 설정)")
print(fruits.split(','))
print()

data = "kim 85 82 78".split()
print(data[0])
print()

for i in range(1,len(data)):
    print(int(data[i])+10,end=" ")
