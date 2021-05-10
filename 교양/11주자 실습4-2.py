# 문자열 탐색과 치환

words = "cat,can,bat,man,fat"

print("문자열 길이(len) : ",len(words))
print("탐색, 처음 (find) : ",words.find("an"))
print("탐색, 끝 (rfind) : ",words.rfind("an"))
print("치환 (replace) : ", words.replace(',',':'))
