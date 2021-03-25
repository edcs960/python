americanoprice = 2000
cafelatteprice = 3000
cappuccinoprice = 3500

amenum = int(input("아메리카노 판매 개수 : "))
cafenum = int(input("카페라테 판매 개수 : "))
cappunum = int(input("카푸치노 판매 개수 : "))

print("총 매출액은", americanoprice * amenum + cafelatteprice * cafenum + cappuccinoprice * cappunum, "입니다.")
