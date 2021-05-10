infile = open("test.txt","r",encoding="utf8")
data = infile.readline()
while data != "":
    print(data.rstrip()) # rstrip을 이용하여 줄바꿈 문자(\n)을 삭제
    data = infile.readline()
infile.close()
