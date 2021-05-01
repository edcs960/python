import random

CapData = {}
CapData["독일"] = "베를린"
CapData["프랑스"] = "파리"
CapData["이탈리아"] = "로마"
CapData["룩셈부르크"] = "룩셈부르크"
CapData["벨기에"] = "브뤼셀"
CapData["네덜란드"] = "암스테르담"
CapData["아일랜드"] = "더블린"
CapData["영국"] = "런던"
CapData["러시아"] = "모스크바"
CapData["노르웨이"] = "오슬로"
CapData["스위스"] = "베"
CapData["체코"] = "프라하"
CapData["핀란드"] = "바르샤바"

nationList = list(CapData.keys())
count = 0
print("수도 이름을 맞춰 보세요.")

for i in range(5):
    nation = random.choice(nationList)
    answer = input("[" + str(i+1) + "]" + nation + "의 수도 : ")
    if answer == CapData[nation]:
        print("정답입니다.")
        count += 1
    else:
        print("틀렸습니다. 정답은 ",CapData[nation], "입니다.")

print()
print("5 문제 중 총", count, "문제를 맞추었습니다.")
