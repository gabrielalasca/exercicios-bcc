# Pede 3 números ao usuário e armazena em lista
numeros = []

for i in range(1, 4):
    n = float(input(f"Digite o {i}º número: "))
    numeros.append(n)

print("Sua lista:", numeros)
