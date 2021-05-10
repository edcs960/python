infile = open("test.txt","r",encoding="utf8")
data = infile.readlines()

for line in data:
    print(line)
print()
print("rstrip 사용")
print()
for line in data:
    print(line.rstrip())

infile.close()
