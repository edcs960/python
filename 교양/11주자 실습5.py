def makeDict():
    infile = open("myword.txt","r",encoding="utf8")
    data = infile.readlines()
    n = len(data)
    for i in range(0,n,2):
        E_dict[data[i].rstrip()] = data[i+1].rstrip()

def findWords():
    word = input("검색할 단어를 입력하세요:")
    while word != "":
        if E_dict.get(word) != None:
            print(E_dict[word])
        else:
            print("그런 단어는 없습니다.")
        word = input("검색할 단어를 입력하세요:")

E_dict = {}
makeDict()
findWords()
