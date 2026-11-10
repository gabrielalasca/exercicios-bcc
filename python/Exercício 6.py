pares   = [n for n in range(1, 11) if n % 2 == 0]
impares = [n for n in range(1, 11) if n % 2 != 0]

juntas = pares + impares

print("Pares:",   pares)
print("Ímpares:", impares)
print("Juntas:",  juntas)
