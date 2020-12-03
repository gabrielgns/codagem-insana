:- module(telas_dinamicas, [tela_ranking/3, tela_round/4, tela_palavras_corrigidas/5, offsets_verticais/2, offsets_horizontais/2]).

:- use_module(library(random), [random_between/3]).
:- use_module(library(lists), [member/2]).
:- use_module(util, [repete_string/3, write_stringr/2, soma_lista/2, centraliza/1, centraliza_titulo/2]).
:- use_module(telas, [tela/1]).


% Telas Dinâmicas
tela_round(Palavras, Pont, V, H):-
    tela(limpa),
    length(Palavras, N),
    area_palavras(Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).


tela_palavras_corrigidas(Plvrs_acertadas, Palavras, Pont, V, H):-
    tela(limpa),
    length(Palavras, N),
    area_palavras_corrigidas(Plvrs_acertadas, Palavras, V, H),
    completa_tela_round(N, V),
    barra_pontuacao(Pont).


tela_ranking(Nome, Lista_nomes, Lista_pontuacoes):-
    tela(limpa),
    nth0(0, Lista_nomes, Nome1),
    nth0(1, Lista_nomes, Nome2),
    nth1(3, Lista_nomes, Nome3),

    nth0(0, Lista_pontuacoes, Pontuacao1),
    nth0(1, Lista_pontuacoes, Pontuacao2),
    nth1(3, Lista_pontuacoes, Pontuacao3),

    atom_concat("Ranking da Linguagem ", Nome,Answer1),
    repete_string("\n", 6,Res),
    write(Res),
    centraliza_titulo(Answer1, green), nl, nl,

    atom_concat("1. ", Nome1 ,Answer15),
    string_concat(Answer15, " .......... " ,Answer16),
    string_concat(Answer16, Pontuacao1 ,Answer17),
    centraliza(Answer17), nl,

    string_concat("2. " ,Nome2, Answer18),
    string_concat(Answer18, " .......... " ,Answer19),
    string_concat(Answer19, Pontuacao2 ,Answer20),
    centraliza(Answer20), nl,

    string_concat("3. ", Nome3,Answer21),
    string_concat(Answer21, " .......... " ,Answer22),
    string_concat(Answer22, Pontuacao3 ,Answer23),
    centraliza(Answer23), nl,

    repete_string("\n",9,R),
    write(R).

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
    number_string(Pontuacao, P),
    string_concat("Pontuação: ", P, Barra),
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
