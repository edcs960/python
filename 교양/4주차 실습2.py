import turtle
import math


x1 = int(input("x1 : "))
y1 = int(input("y1 : "))
x2 = int(input("x2 : "))
y2 = int(input("y2 : "))

t = turtle.Turtle()
t.penup()
t.goto(x1, y1)
t.pendown()
t.goto(x2, y2)

result = math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
print("선분의 길이는 ",result,"입니다.")
