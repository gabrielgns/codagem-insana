:- module(telas_dinamicas, [tela_round/4, tela_palavras_corrigidas/5]).

:- use_module(library(random), [random_between/3]).
:- use_module(library(lists), [member/2]).
:- use_module(util, [repete_string/3, write_stringr/2, soma_lista/2]).
:- use_module(telas, [tela/1]).
/*
    Substituir a funcao nEspacos e centralizar por um import
    em centralizar de util
*/
nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).


centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).


% Telas Dinâmicas
tela_round(Palavras, Pont, V, H):-
    tela(limpa),
    length(Palavras, N),
    offsets_verticais(N, V),
    offsets_horizontais(Palavras, H),
    area_palavras(Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).


tela_palavras_corrigidas(Plvrs_acertadas, Palavras, Pont, V, H):-
    tela(limpa),
    length(Palavras, N),
    area_palavras_corrigidas(Plvrs_acertadas, Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).


% Componentes das telas
area_palavras([], _, _).
area_palavras([P|R], [OV|ROV], [OH|ROH]):-
    repete_string("\n", OV, Linhas),
    write(Linhas),
    repete_string(" ", OH, Espacos),
    write(Espacos),
    write(P), nl,
    area_palavras(R, ROV, ROH).


area_palavras_corrigidas(_, [], _, _).
area_palavras_corrigidas(PC, [P|PR], [OV|ROV], [OH|ROH]):-
    write_stringr("\n", OV),
    write_stringr(" ", OH),
    ( member(P, PC) -> ansi_format([fg(green)], '~w', [P])
    ; ansi_format([fg(red)], '~w', [P])
    ), nl,
    area_palavras_corrigidas(PC, PR, ROV, ROH).


barra_pontuacao(Pontuacao):-
    string_concat("Pontuação: ", Pontuacao, Barra),
    ansi_format([bg(green)], '~w', [Barra]),
    nl.


% Funções para gerar Offsets aleatórios das palavras
offsets_verticais(0, []).
offsets_verticais(N, Offset):-
    random_between(0, 5, OV1),
    N1 is N - 1,
    offsets_verticais(N1, OV2),
    Offset = [OV1|OV2].


offsets_horizontais([], []).
offsets_horizontais([P|R], Offset):-
    Lim is 70,
    string_length(P, MaxR),
    Fim is Lim - MaxR,% - 1,
    random_between(0, Fim, OV1),
    offsets_horizontais(R, OV2),
    Offset = [OV1|OV2].


% Funções auxiliares
completa_tela_round(N_palavras, Offsets_verticais):-
    soma_lista(Offsets_verticais, Soma_offsets),
    N_linhas is 18 - Soma_offsets - N_palavras,
    repete_string("\n", N_linhas, Linhas),
    write(Linhas).


% Main para testes. Tem que adicionar o main
% nos predicados exportados para poder usá-lo
main:-
    Input1 = ["pal1"],
    Input2 = ["pal2", "pal3"],
    Input3 = ["pal5", "pal6", "pal7"],

    Pontuacao is 100,
    tela_round(Input1, Pontuacao, V1, H1),
    get_single_char(_),
    tela_palavras_corrigidas([""], Input1, V1, H1, Pontuacao),
    get_single_char(_),

    tela_round(Input2, Pontuacao, V2, H2),
    get_single_char(_),
    tela_palavras_corrigidas(["pal3"], Input2, V2, H2, Pontuacao),
    get_single_char(_),

    tela_round(Input3, Pontuacao, V3, H3),
    get_single_char(_),
    tela_palavras_corrigidas(["pal6"], Input3, V3, H3, Pontuacao),
    get_single_char(_).
