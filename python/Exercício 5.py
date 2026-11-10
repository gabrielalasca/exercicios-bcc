palavras = ["banana", "uva", "morango", "kiwi", "framboesa"]

mais_longa  = max(palavras, key=len)
mais_curta  = min(palavras, key=len)

print("Lista:", palavras)
print("Mais longa:", mais_longa)
print("Mais curta:", mais_curta)
