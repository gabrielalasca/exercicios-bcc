# Calculadora e Conversor de Temperatura

Aplicativo com interface feito em Processing no modo Java. É tanto uma calculadora, quanto um conversor de temperatura, controlado inteiramente pelo mouse.

Funcionalidades:
Calculadora
- Operações: soma, subtração, multiplicação e divisão
- Botões extras: `C` (limpar), `±` (inverter sinal) e `%` (porcentagem)
- Números decimais (a vírgula é convertida para ponto internamente)
- Encadeamento de operações (ex.: `2 + 3 X 4`)

Conversor de temperatura
- Celsius → Fahrenheit
- Celsius → Kelvin
- Fahrenheit → Celsius
- Fahrenheit → Kelvin
- O resultado aparece em tempo real enquanto o valor é digitado

Interface
- Menu inicial com navegação entre as telas
- Teclado numérico desenhado na tela
- Botão "Voltar" em todas as telas

Como executar
1. Baixe e instale o [Processing](https://processing.org/download).
2. Baixe este repositório e extraia.
3. Abra o arquivo `calculadora.pde` no Processing.
4. Clique no botão Play

> A pasta e o arquivo `.pde` precisam ter o mesmo nome para o Processing abrir corretamente.

Estrutura do código
- `setup()` e `draw()`: configuração da janela e desenho da tela atual
- `mousePressed()`: detecta cliques e encaminha para a tela correta
- `desenha...()`: funções que desenham cada tela
- `processaTecladoCalc()` e `processaTecladoConv()`: lógica dos botões
- `converteTemperatura()`: cálculo das conversões
- `checaClique()`: verifica se o mouse está dentro de um botão

Possíveis melhorias
- Tratar divisão por zero
- Aceitar entrada pelo teclado do computador
- Adicionar histórico de operações
- Incluir mais conversões (distância, peso, etc.)

Feito por **Gabriel Alasca**, estudante de Ciência da Computação na Pontifícia Universidade Católica do Paraná.
- GitHub: [@gabrielalasca](https://github.com/gabrielalasca)
