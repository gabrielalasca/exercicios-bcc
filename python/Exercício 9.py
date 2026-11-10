import random
import string

alfabeto = list(string.ascii_lowercase)
random.shuffle(alfabeto)

letra_alvo = random.choice(alfabeto)
pos_correta = alfabeto.index(letra_alvo) + 1  

print("Alfabeto embaralhado:", alfabeto)
print(f"Em que posição está a letra '{letra_alvo}'? (1 a 26)")

tentativa = int(input("Sua resposta: "))

if tentativa == pos_correta:
    print("Acertou")
else:
    print(f"Errou. A posição correta era {pos_correta}")
