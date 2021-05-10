filename = input("파일 이름을 입력하세요: ")
del_word = input("삭제할 문자열을 입력하세요: ")

infile = open(filename, "r", encoding="utf8")
data = infile.read()
infile. close()

data = data.replace(del_word,"")

newfile = open(filename,"w",encoding="utf8")
newfile.write(data)
newfile.close()

print("변경된 파일이 저장되었습니다.")
