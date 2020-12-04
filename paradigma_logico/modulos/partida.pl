:- module(partida, [partida/3]).

:- use_module(library(lists), [member/2]).
:- use_module(telas_dinamicas).
:- use_module(pontuacao).
:- use_module(temporizador, [tempo/2]).


tentativas(0, _, _, _, _, []).
tentativas(N, Pal, Pontos, Off_v, Off_h, [P|T]):-
    write(Pontos),
    tela_round(Pal, Pontos, Off_v, Off_h),
    read_string(user_input, "\n", "\r\t ", _, P),
    N1 is N - 1,
    tentativas(N1, Pal, Pontos, Off_v, Off_h, T).


corrige([], _, []).
corrige([P| TP], PR, Ret):-
    (   member(P, PR) -> Ret = [P| TR]
    ;   Ret = TR
    ),
    corrige(TP, PR, TR).


partida([], P, P).
partida([Round| Resto_partida], Pontos, Pontuacao_final):-
    length(Round, N_palavras),
    offsets_verticais(N_palavras, Offset_vert),
    offsets_horizontais(Round, Offsets_hori),
    tempo(second, T0),
    tentativas(N_palavras, Round, Pontos, Offset_vert, Offsets_hori, Entradas),
    tempo(second, T1),
    Tempo_round is T1 - T0,
    corrige(Entradas, Round, Palavras_acertadas),
    length(Palavras_acertadas, N_acertos),
    calculaPontos(Tempo_round, N_palavras, N_acertos, Pontos_round),
    Pontuacao_atual is Pontos + Pontos_round,
    tela_palavras_corrigidas(Palavras_acertadas, Round, Pontuacao_atual, Offset_vert, Offsets_hori),
    sleep(1),
    partida(Resto_partida, Pontuacao_atual, Pontuacao_final).


main:-
    Palavras_partida = [["pal1"], ["pal2", "pal3"], ["pal4", "pal5", "pal6"]],
    partida(Palavras_partida, 100, Pontos),
    write("Pontos:"), write(Pontos).
