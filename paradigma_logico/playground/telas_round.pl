%:- module(telas_dinamicas, )
:- use_module(library(random), [random_between/3]).
:- use_module(library(lists), [member/2]).

repeat(Str, 1, Str).
repeat(_, 0, "").
repeat(Str, Num, Res):-
    Num1 is Num-1,
    repeat(Str,Num1,Res1),
    string_concat(Str, Res1, Res).

printR(_, 0).
printR(S, N):-
    write(S),
    N1 is N - 1,
    printR(S, N1).

nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).

centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).

/*
offsets_v(N, N, []).
offsets_v(NPal, Ind, Offset):-
    Lim is 18,
    MaxR is (Lim//NPal),
    Inicio is Ind * MaxR,
    Fim is ((Ind + 1) * MaxR) - 1,
    random_between(Inicio, Fim, OV1),
    Prox_ind is Ind + 1,
    offsets_v(NPal, Prox_ind, OV2),
    Offset = [OV1|OV2].
*/
offsets_v(0, []).
offsets_v(N, Offset):-
    random_between(0, 5, OV1),
    N1 is N - 1,
    offsets_v(N1, OV2),
    Offset = [OV1|OV2].


offsets_h([], []).
offsets_h([P|R], Offset):-
    Lim is 70,
    string_length(P, MaxR),
    Fim is Lim - MaxR,% - 1,
    random_between(0, Fim, OV1),
    offsets_h(R, OV2),
    Offset = [OV1|OV2].


area_palavras([], _, _).
area_palavras([P|R], [OV|ROV], [OH|ROH]):-
    repeat("\n", OV, Linhas),
    write(Linhas),
    repeat(" ", OH, Espacos),
    write(Espacos),
    write(P), nl,
    area_palavras(R, ROV, ROH).

limpa_tela:- write('\e[H\e[2J').

soma_lista([], 0).
soma_lista([H|T], R):-
    soma_lista(T, R1),
    R is H + R1.

tela_round(Palavras, Pont, V, H):-
    limpa_tela,
    length(Palavras, N),
    offsets_v(N, V),
    offsets_h(Palavras, H),
    area_palavras(Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).



completa_tela_round(N_palavras, Offsets_verticais):-
    soma_lista(Offsets_verticais, Soma_offsets),
    N_linhas is 18 - Soma_offsets - N_palavras,
    repeat("\n", N_linhas, Linhas),
    write(Linhas).


barra_pontuacao(Pontuacao):-
    string_concat("Pontuação: ", Pontuacao, Barra),
    ansi_format([bg(green)], '~w', [Barra]),
    nl.


tela_palavras_corretas(Plvrs_corretas, Palavras, V, H, Pont):-
    limpa_tela,
    length(Palavras, N),
    area_palavras_corrigidas(Plvrs_corretas, Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).
/*
area_palavras_corrigidas(_, [], _, _).
area_palavras_corrigidas(PC, [P|PR], [OV|ROV], [OH|ROH]):-
    printR("\n", OV),
    printR(" ", OH),
    ( member(P, PC) -> ansi_format([fg(green)], '~w', [P])
    ; ansi_format([fg(red)], '~w', [P])
    ), nl,
    area_palavras_corrigidas(PC, PR, ROV, ROH).
*/
area_palavras_corrigidas(_, [], _, _).
area_palavras_corrigidas(PC, [P|PR], [OV|ROV], [OH|ROH]):-
    repeat("\n", OV, Linhas),
    write(Linhas),
    repeat(" ", OH, Espacos),
    write(Espacos),
    ( member(P, PC) -> ansi_format([fg(green)], '~w', [P])
    ; ansi_format([fg(red)], '~w', [P])
    ), nl,
    area_palavras_corrigidas(PC, PR, ROV, ROH).

main:-
    Input1 = ["pal1"],
    Input2 = ["pal2", "pal3"],
    Input3 = ["pal5", "pal6", "pal7"],

    Pontuacao is 100,
    tela_round(Input1, Pontuacao, V1, H1),
    get_single_char(_),
    tela_palavras_corretas([""], Input1, V1, H1, Pontuacao),
    get_single_char(_),

    tela_round(Input2, Pontuacao, V2, H2),
    get_single_char(_),
    tela_palavras_corretas(["pal3"], Input2, V2, H2, Pontuacao),
    get_single_char(_),

    tela_round(Input3, Pontuacao, V3, H3),
    get_single_char(_),
    tela_palavras_corretas(["pal6"], Input3, V3, H3, Pontuacao),
    get_single_char(_).
