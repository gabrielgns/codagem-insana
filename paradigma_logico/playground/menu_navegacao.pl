limpa_tela:- write('\e[H\e[2J').

menu_principal:-
    limpa_tela,
    write("Menu Principal"),
    nl,
    get_single_char(Comando),
    (   Comando == 49
    ->  selecao_fase
    ;   Comando == 50
    ->  selecao_ranking
    ;   write("Sair do jogo")
    ).

selecao_ranking:-
    limpa_tela,
    write("Selecao Ranking"),
    nl,
    get_single_char(Comando),
    (   Comando == 49
    ->  ranking("Ranking python")
    ;   Comando == 50
    ->  ranking("Ranking Java")
    ;   Comando == 51
    ->  ranking("Ranking Haskell")
    ;   Comando == 52
    ->  ranking("Ranking Prolog")
    ;   menu_principal
    ).

ranking(Tela):-
    limpa_tela,
    write(Tela),
    nl,
    get_single_char(_),
    selecao_ranking.


selecao_fase:-
    limpa_tela,
    write("Selecao Fases"),
    nl,
    get_single_char(Comando),
    (   Comando == 49
    ->  ranking("Fase python")
    ;   Comando == 50
    ->  ranking("Fase Java")
    ;   Comando == 51
    ->  ranking("Fase Haskell")
    ;   Comando == 52
    ->  ranking("Fase Prolog")
    ;   menu_principal
    ).

main:-
    limpa_tela,
    menu_principal,
    nl, halt.
