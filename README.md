# Especificação Projeto PLP 2020.3
# Codagem INSANA

Trata-se de um jogo de digitação onde as palavras vão passando na tela de cima para baixo. O jogador deve digitar a palavra para fazer ela desaparecer e ganha pontos quando consegue fazer isso à tempo. Quando a palavra consegue atravessar a tela, o jogador perde uma vida. Depois que perder todas as vidas o jogo acaba.

## Funcionamento Básico do Jogo
Ao iniciar uma partida, uma palavra aparece na tela e em seguida a execução é pausada para o usuário digitá-la. 
As palavras podem aparecer em vários lugares, não tem um lugar fixo, e esses lugares são escolhidos de forma randômica.

### Menu principal 
Interface antes do jogo que permite ao jogador escolher o tema das palavras, escolher em qual velocidade deseja começar, ver o ranking das melhores.

### Temas
As palavras de um tema são lidas de um arquivo e são escolhidas de forma aleatória durante a execução do jogo. O jogador pode escolher um tema específico das palavras que vão aparecer. Por exemplo: as palavras que aparecem na tela são da sintaxe de alguma linguagem (Python, C++, etc). Os pacotes das linguagens serão definidos pelo seu paradigma Por exemplo: POO (Python, Java), Funcional (Haskell, Miranda, Rust), Imperativas (C++, Ruby).


### Escalamento de dificuldade
Conforme o jogador vai progredindo, mais palavras aparecem na tela de uma vez só. Mas para efeitos de pontuação, elas contam como apenas 1. Isso é feito com o objetivo de apressar o jogador para digitar mais rápido. Para compensar esse aumento na dificuldade, o fator base da pontuação é aumentado um pouco.

### Pontuação
Ele tem todo o tempo que quiser para digitar, mas a pontuação é calculada com base no tempo que ele demorou. Então se ele demorar demais, mesmo que acerte a palavra, ele não ganha a pontuação. A cada x segundos, o fator que multiplica a pontuação diminui. Se o jogador errar a palavra, ele perde uma vida.

### Registro de Recordes 
Ao final da partida, se a pontuação obtida foi boa o suficiente para estar entre as três melhores, o jogador é convidado a colocar o seu nome para registrar nome e pontuação no ranking.

### Coloração das palavras
Quando o jogador acerta, a palavra fica verde, desaparece e entra a próxima palavra. Se errar, a palavra fica vermelha.
Palavras bônus/ônus usam coloração dourada.

### Ônus e Bônus
Entre as palavras pode vir uma palavra dourada que tem a chance de ⅘ de vir um multiplicador de pontos e ⅕ de vir um ônus que pula ele de nível sem contar o aumento de pontos.

## Como Jogar em Haskell
Você deve ter o ghc instalado na sua máquina. Abra o terminal e clone o repositório com
```git clone https://github.com/gabrielgns/codagem-insana.git```
Entre na pasta do repo
```cd codagem-insana```
E na pasta do paradigma
```cd paradigma_funcional```
Compile o main
```ghc main.hs```
Rode o código
```./main```
Agora é só navegar pelo menu, aproveitar o jogo e olhar suas melhores pontuações.

## Como jogar em Prolog
Você deve ter o swi instalado na sua máquina. Abra o terminal e clone o repositório com
```git clone https://github.com/gabrielgns/codagem-insana.git```
Entre na pasta do repo
```cd codagem-insana```
E na pasta do paradigma
```cd paradigma_logico```
Compile o main
```swipl -s main.pl```
Rode o código
```main.```
dentro do compilador

Agora é só navegar pelo menu, aproveitar o jogo e olhar suas melhores pontuações.
