infile = open("test.txt","r",encoding="utf8")
data = infile.readlines() # 파일의 데이터를 리스트 데이터로 생성
print(data)
infile.close()
