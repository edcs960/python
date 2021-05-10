infile = open("test.txt","r",encoding="utf8")
data = infile.readline()
while data != "":
    print(data)
    data = infile.readline()
infile.close()
