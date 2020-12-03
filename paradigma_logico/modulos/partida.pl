

:- use_module(telas_dinamicas).
:- use_module(library(lists), [member/2]).


tentativas(0, []).
tentativas(N, [P|T]):-
    read(E),
    atom_string(E, P),
    N1 is N - 1,
    tentativas(N1, T).


corrige([], _, []).
corrige([P| TP], PR, Ret):-
    (   member(P, PR) -> Ret = [P| TR]
    ;   Ret = TR
    ),
    corrige(TP, PR, TR).


partida([], P, P).
partida([Round| Resto_partida], Pontuacao, Pontuacao_final):-
    tela_round(Round, Pontuacao, Offset_vertical, Offsets_horizontal),
    length(Round, N_palavras),
    tentativas(N_palavras, Entradas),
    corrige(Entradas, Round, Palavras_acertadas),
    tela_palavras_corrigidas(Palavras_acertadas, Round, Pontuacao, Offset_vertical, Offsets_horizontal),
    read(C),
    partida(Resto_partida, Pontuacao, Pontuacao_final).





main:-
    Palavras_round = [["pal1"], ["pal2", "pal3"], ["pal4", "pal5", "pal6"]],
    %corrige(["pal1", "asdf"], ["pal1", "pal2"], Palavras_corrigidas),
    partida(Palavras_round, 100, _).
