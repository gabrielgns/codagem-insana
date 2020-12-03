:- use_module(telas_dinamicas).
:- use_module(library(lists), [member/2]).


tentativas(0, _, _, _, _, []).
tentativas(N, Pal, Pontos, Off_v, Off_h, [P|T]):-
    write(Pontos),
    tela_round(Pal, Pontos, Off_v, Off_h),
    read(E),
    atom_string(E, P),
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
    T0 is 0, % Substituir pela funcao de pegar o tempo
    tentativas(N_palavras, Round, Pontos, Offset_vert, Offsets_hori, Entradas),
    T1 is 3, % Substituir pela funcao de pegar o tempo
    Tempo_round is T0 - T1,
    corrige(Entradas, Round, Palavras_acertadas),
    length(Palavras_acertadas, N_acertos),
    % Importar essa funcao abaixo depois
    % calculaPontos(Tempo_round, N_palavras, N_acertos, Pontos_round)
    % Substituir por tela_palavras_corrigidas(Palavras_acertadas, Round, Pontos_round, Offset_vert, Offsets_hori),
    tela_palavras_corrigidas(Palavras_acertadas, Round, Pontos, Offset_vert, Offsets_hori),
    read(C), % Substituir essa linha por um sleep de 1 seg.
    % Substituir por partida(Resto_partida, Pontos + Pontos_round, Pontuacao_final).
    partida(Resto_partida, Pontos, Pontuacao_final).


main:-
    Palavras_partida = [["pal1"], ["pal2", "pal3"], ["pal4", "pal5", "pal6"]],
    partida(Palavras_partida, 100, Pontos),
    write("Pontos:"), write(Pontos).
