:- module(pontuacao, [calculaPontos/4]).

calculaPontos(Tempo, Peso, QtdPalavras, Pontos):-
    calcularFatorPontuacao(Tempo, R),
    Pontos is Peso * QtdPalavras * R.

calcularFatorPontuacao(Tempo, R):-
    (Tempo =< 2 -> R is 400;
    (Tempo =< 4 -> R is 250;
    (Tempo =< 5 -> R is 100;
    R is 0))).

main:- calculaPontos(2, 1, 3, Pontos),
    write(Pontos), nl, halt.
