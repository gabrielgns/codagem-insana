:- module(sorteio_palavras, [sortear_palavras_partida/2]).
:- use_module(linguagens, [linguagem/2]).
:- use_module(library(random), [random_between/3]).


sortear_palavras(0, _, []).
sortear_palavras(N, Lista, [Pal| T]):-
    length(Lista, Len),
    Max is Len - 1,
    random_between(0, Max, Indice),
    nth0(Indice, Lista, Pal),
    N1 is N - 1,
    sortear_palavras(N1, Lista, T).


sortear_palavras_partida(Linguagem, Palavras_partida):-
    linguagem(Linguagem, Palavras_reservadas),
    sortear_palavras(1, Palavras_reservadas, R1),
    sortear_palavras(1, Palavras_reservadas, R2),
    sortear_palavras(2, Palavras_reservadas, R3),
    sortear_palavras(2, Palavras_reservadas, R4),
    sortear_palavras(3, Palavras_reservadas, R5),
    sortear_palavras(3, Palavras_reservadas, R6),
    Palavras_partida = [R1, R2, R3, R4, R5, R6].


main:-
    sortear_palavras_partida(python, P),
    write(P),
    nl, halt.
