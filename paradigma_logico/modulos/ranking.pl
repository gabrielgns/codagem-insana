:- module(ranking, [ordena_ranking/4]).

ordena_ranking(P, N, P_ord, N_ord):-
    lista_tuplas(P, N, Tuplas),
    sort(Tuplas, Tuplas_ord),
    tupla_para_lista(Tuplas_ord, P_ord, N_ord).

lista_tuplas([], [], []).
lista_tuplas([P| Tp], [N| Tn], [R | Tr]):-
    R = (P, N),
    lista_tuplas(Tp, Tn, Tr).

tupla_para_lista([], [], []).
tupla_para_lista([(A, B)| T], [A| L1], [B| L2]):-
    tupla_para_lista(T, L1, L2).


main:-
    Pontos = [2, 1, 3],
    Nomes = ["B", "A", "C"],
    ordena_ranking(Pontos, Nomes, Pontos_ord, Nomes_ord),
    write(Pontos_ord), nl,
    write(Nomes_ord), nl, halt.
