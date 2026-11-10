// variaveis 
int tela = 0;
String visor = "";
String visorConv = "";
float num1 = 0;
char operacao = ' ';

// constantes design
final int LARGURA_BOTAO_MENU = 500;
final int ALTURA_BOTAO_MENU = 60;
final int X_BOTAO_MENU = 350;

// config calculadora
final int TAM_BOTAO_CALC = 80;
final float GAP_X_CALC = 25.5;
final int GAP_Y_CALC = 10;
final int INICIO_X_CALC = 402;
final int INICIO_Y_CALC = 160;
final String BOTOES_CALC = "C±%/789X456-123+ 0,=";

// config teclado conversor
final int TAM_BOTAO_CONV = 80;
final float GAP_X_CONV = 25.5;
final int GAP_Y_CONV = 10;
final int INICIO_X_CONV = 402;
final int INICIO_Y_CONV = 280;
final String BOTOES_CONV = "C   789 456 123  0,=";

// config inicial
void setup() {
  size(1200, 890);
  textAlign(CENTER, CENTER);
  textSize(23);
}

// loop render interface
void draw() {
  switch (tela) {
    case 0: desenhaMenu(); break;
    case 1: desenhaCalculadora(); break;
    case 2: desenhaMenuConversor(); break;
    case 3: desenhaTelaConversao("Celsius -----> Fahrenheit"); break;
    case 4: desenhaTelaConversao("Celsius -----> Kelvin"); break;
    case 5: desenhaTelaConversao("Fahrenheit -----> Celsius"); break;
    case 6: desenhaTelaConversao("Fahrenheit -----> Kelvin"); break;
  }
}

// detecçao de cliques
void mousePressed() {
  switch (tela) {
    case 0: cliqueMenu(); break;
    case 1: cliqueCalculadora(); break;
    case 2: cliqueMenuConversor(); break;
    case 3: case 4: case 5: case 6:
      cliqueTelaConversao();
      break;
  }
}

// funções de renderização

void desenhaMenu() {
  background(233);

  fill(140, 233, 123);
  rect(X_BOTAO_MENU, 100, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU, 100);
  fill(0);
  text("Calculadora", 600, 130);

  fill(233, 140, 123);
  rect(X_BOTAO_MENU, 450, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU, 100);
  fill(0);
  text("Conversor de Temperatura", 600, 480);
}

void desenhaCalculadora() {
  background(255);

  // visor
  fill(220);
  rect(400, 90, 400, 60);
  fill(0);
  textSize(32);
  textAlign(RIGHT, CENTER);
  text(visor, 400 + 400 - 10, 90 + 30);

  textAlign(CENTER, CENTER);
  textSize(23);

  // grade de botoes
  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < 4; i++) {
      float x = INICIO_X_CALC + i * (TAM_BOTAO_CALC + GAP_X_CALC);
      float y = INICIO_Y_CALC + j * (TAM_BOTAO_CALC + GAP_Y_CALC);
      char letra = BOTOES_CALC.charAt(j * 4 + i);

      if (isOperador(letra)) {
        fill(255, 150, 0);
      } else {
        fill(128);
      }

      rect(x, y, TAM_BOTAO_CALC, TAM_BOTAO_CALC);
      fill(255);
      text(letra, x + TAM_BOTAO_CALC/2, y + TAM_BOTAO_CALC/2);
    }
  }
  desenhaVoltar();
}

void desenhaMenuConversor() {
  background(255);

  fill(0);
  textSize(32);
  text("Conversor de Temperatura", 600, 100);
  textSize(23);

  desenhaBotaoConversor(145, color(255, 200, 200), "Celsius -----> Fahrenheit");
  desenhaBotaoConversor(245, color(255, 220, 200), "Celsius -----> Kelvin");
  desenhaBotaoConversor(345, color(255, 240, 200), "Fahrenheit -----> Celsius");
  desenhaBotaoConversor(445, color(220, 255, 200), "Fahrenheit -----> Kelvin");

  desenhaVoltar();
}

void desenhaTelaConversao(String titulo) {
  background(255);

  // titulo
  fill(0);
  textSize(28);
  text(titulo, 600, 80);
  textSize(23);

  // visor de entrada
  fill(0);
  text("Valor de entrada:", 600, 155);
  fill(220);
  rect(400, 170, 400, 60);
  fill(0);
  textSize(28);
  textAlign(RIGHT, CENTER);
  text(visorConv, 790, 200);
  textAlign(CENTER, CENTER);
  textSize(23);

  // visor de resultado
  fill(0);
  text("Resultado:", 600, 245);
  fill(180, 230, 180);
  rect(400, 258, 400, 60);
  fill(0);
  textSize(28);
  textAlign(RIGHT, CENTER);

  // calcula e exibe resultado em tempo real
  if (visorConv != "") {
    float entrada = float(visorConv);
    float resultado = converteTemperatura(entrada, tela);
    String resStr;
    if (resultado == int(resultado)) {
      resStr = str(int(resultado));
    } else {
      resStr = nf(resultado, 0, 2); 
    }
    text(resStr, 790, 288);
  }

  textAlign(CENTER, CENTER);
  textSize(23);

  // teclado numérico
  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < 4; i++) {
      float x = INICIO_X_CONV + i * (TAM_BOTAO_CONV + GAP_X_CONV);
      float y = INICIO_Y_CONV + j * (TAM_BOTAO_CONV + GAP_Y_CONV);
      char letra = BOTOES_CONV.charAt(j * 4 + i);

      if (letra == ' ') continue; 

      if (letra == 'C' || letra == '=') {
        fill(255, 150, 0);
      } else if (letra == ',') {
        fill(100, 100, 200);
      } else {
        fill(128);
      }

      rect(x, y, TAM_BOTAO_CONV, TAM_BOTAO_CONV);
      fill(255);
      text(letra == '=' ? "OK" : str(letra), x + TAM_BOTAO_CONV/2, y + TAM_BOTAO_CONV/2);
    }
  }

  desenhaVoltar();
}

void desenhaBotaoConversor(int y, color cor, String texto) {
  fill(cor);
  rect(X_BOTAO_MENU, y, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU, 20);
  fill(0);
  text(texto, 600, y + 30);
}

void desenhaVoltar() {
  fill(200, 100, 100);
  rect(100, 100, 100, 100, 100);
  fill(255);
  textSize(20);
  text("Voltar", 150, 150);
  textSize(23);
}


void cliqueMenu() {
  if (checaClique(X_BOTAO_MENU, 100, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) {
    tela = 1;
  } else if (checaClique(X_BOTAO_MENU, 450, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) {
    tela = 2;
  }
}

void cliqueCalculadora() {
  if (detectaVoltar(0)) return;

  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < 4; i++) {
      float x = INICIO_X_CALC + i * (TAM_BOTAO_CALC + GAP_X_CALC);
      float y = INICIO_Y_CALC + j * (TAM_BOTAO_CALC + GAP_Y_CALC);

      if (checaClique(x, y, TAM_BOTAO_CALC, TAM_BOTAO_CALC)) {
        char letra = BOTOES_CALC.charAt(j * 4 + i);
        processaTecladoCalc(letra);
        return;
      }
    }
  }
}

void cliqueTelaConversao() {
  if (detectaVoltar(2)) {
    visorConv = ""; 
    return;
  }

  for (int j = 0; j < 5; j++) {
    for (int i = 0; i < 4; i++) {
      float x = INICIO_X_CONV + i * (TAM_BOTAO_CONV + GAP_X_CONV);
      float y = INICIO_Y_CONV + j * (TAM_BOTAO_CONV + GAP_Y_CONV);
      char letra = BOTOES_CONV.charAt(j * 4 + i);

      if (letra == ' ') continue;

      if (checaClique(x, y, TAM_BOTAO_CONV, TAM_BOTAO_CONV)) {
        processaTecladoConv(letra);
        return;
      }
    }
  }
}

void processaTecladoCalc(char letra) {
  if (letra >= '0' && letra <= '9') {
    visor += letra;
  } else if (letra == 'C') {
    visor = "";
    num1 = 0;
    operacao = ' ';
  } else if (letra == '+' || letra == '-' || letra == 'X' || letra == '/') {
    if (visor != "" && operacao != ' ') {
      calcular();
    } else if (visor != "") {
      num1 = float(visor);
    }
    operacao = letra;
    visor = "";
  } else if (letra == ',') {
    visor += ".";
  } else if (letra == '±' && visor != "") {
    visor = str(float(visor) * -1);
  } else if (letra == '%' && visor != "") {
    visor = str(float(visor) / 100);
  } else if (letra == '=') {
    if (visor == "" || operacao == ' ') return;
    calcular();
    num1 = 0;
    operacao = ' ';
  }
}

void processaTecladoConv(char letra) {
  if (letra >= '0' && letra <= '9') {
    visorConv += letra;
  } else if (letra == 'C') {
    visorConv = "";
  } else if (letra == ',') {
    if (!visorConv.contains(".")) {
      visorConv += ".";
    }
  } else if (letra == '=') {
    
  }
}

void calcular() {
  float num2 = float(visor);
  float resultado = 0;

  if (operacao == '+') resultado = num1 + num2;
  else if (operacao == '-') resultado = num1 - num2;
  else if (operacao == 'X') resultado = num1 * num2;
  else if (operacao == '/') resultado = num1 / num2;

  if (resultado == int(resultado)) {
    visor = str(int(resultado));
  } else {
    visor = str(resultado);
  }
  num1 = resultado;
}

float converteTemperatura(float valor, int modo) {
  switch (modo) {
    case 3: return valor * 9.0/5.0 + 32;        // C -> F
    case 4: return valor + 273.15;               // C -> K
    case 5: return (valor - 32) * 5.0/9.0;      // F -> C
    case 6: return (valor - 32) * 5.0/9.0 + 273.15; // F -> K
    default: return valor;
  }
}

void cliqueMenuConversor() {
  if (detectaVoltar(0)) return;

  if (checaClique(X_BOTAO_MENU, 145, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) tela = 3;
  else if (checaClique(X_BOTAO_MENU, 245, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) tela = 4;
  else if (checaClique(X_BOTAO_MENU, 345, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) tela = 5;
  else if (checaClique(X_BOTAO_MENU, 445, LARGURA_BOTAO_MENU, ALTURA_BOTAO_MENU)) tela = 6;
}

// funções utilitárias

boolean checaClique(float x, float y, float w, float h) {
  return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
}

boolean detectaVoltar(int destino) {
  if (checaClique(100, 100, 100, 100)) {
    tela = destino;
    return true;
  }
  return false;
}

boolean isOperador(char c) {
  return (c == 'C' || c == '/' || c == 'X' || c == '-' || c == '+' || c == '=' || c == '±' || c == '%' || c == ',');
}
