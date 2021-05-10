filename = input("파일 이름을 입력하세요: ")

infile = open(filename, "r",encoding="utf8")

count = 0
for line in infile:
    for ch in line:
        if ch != ' ' and ch != '\t' and ch != '\n':
            count += 1

print("파일 안에는 총", count, "개의 글자가 있습니다.")
infile.close()
