:- module(ranking, [ordena_ranking/4, insere_recorde/6]).
:- use_module(util, [pegar_elementos/3, remover_elementos/3]).
:- use_module(library(lists), [append/3]).


insere_recorde(Nova_Pont, Novo_nome, P_rank, N_rank, NP_rank, NN_rank):-
    append(P_rank, [Nova_Pont], Pontos),
    append(N_rank, [Novo_nome], Nomes),
    ordena_ranking(Pontos, Nomes, P_ord, N_ord),
    remover_elementos(1, P_ord, NP_temp),
    remover_elementos(1, N_ord, NN_temp),
    reverse(NP_temp, NP_rank),
    reverse(NN_temp, NN_rank).


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
    insere_recorde(4, "D", Pontos, Nomes, P_rank, N_rank),
    write(P_rank), nl,
    write(N_rank), nl, halt.
