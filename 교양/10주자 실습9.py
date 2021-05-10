D = {'a':97,'b':98,'c':99}
print(D.get('b'), D.get('d'))
print(list(D.keys()))
print(list(D.values()))
for key in D.keys():
    print(key, ':', D[key])
