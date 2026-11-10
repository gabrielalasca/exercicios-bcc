def criar_tabuleiro():
    return [' '] * 9

def mostrar_tabuleiro(tab):
    print()
    for i in range(0, 9, 3):
        print(f" {tab[i]} | {tab[i+1]} | {tab[i+2]} ")
        if i < 6:
            print("---+---+---")
    print()

def verificar_vencedor(tab, jogador):
    combos = [
        [0,1,2],[3,4,5],[6,7,8],  # linhas
        [0,3,6],[1,4,7],[2,5,8],  # colunas
        [0,4,8],[2,4,6]            # diagonais
    ]
    return any(all(tab[c] == jogador for c in combo) for combo in combos)

tabuleiro = criar_tabuleiro()
atual = 'X'

for rodada in range(9):
    mostrar_tabuleiro(tabuleiro)
    print(f"Vez do jogador {atual}. Escolha (1-9): ", end="")
    pos = int(input()) - 1

    if tabuleiro[pos] != ' ':
        print("Posição ocupada. Tente de novo ")
        continue

    tabuleiro[pos] = atual

    if verificar_vencedor(tabuleiro, atual):
        mostrar_tabuleiro(tabuleiro)
        print(f"Jogador {atual} venceu ")
        break

    atual = 'O' if atual == 'X' else 'X'
else:
    mostrar_tabuleiro(tabuleiro)
    print("Empate")
