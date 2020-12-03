:- use_module(telas, [tela/1]).
:- use_module(telas_dinamicas).

menu_principal:-
    tela(menu),
    get_single_char(Comando),
    (   Comando == 49
    ->  selecao_fase
    ;   Comando == 50
    ->  selecao_ranking
    ;   nl, halt
    ).


selecao_ranking:-
    tela(rankings),
    get_single_char(Comando),
    (   Comando == 49
    ->  tela_ranking("Python", ["JOA", "MAR", "LUI"], [30, 20, 10]), get_single_char(_), selecao_ranking
    ;   Comando == 50
    ->  tela_ranking("Java", ["JOA", "MAR", "LUI"], [30, 20, 10]), get_single_char(_), selecao_ranking
    ;   Comando == 51
    ->  tela_ranking("Haskell", ["JOA", "MAR", "LUI"], [30, 20, 10]), get_single_char(_), selecao_ranking
    ;   Comando == 52
    ->  tela_ranking("Prolog", ["JOA", "MAR", "LUI"], [30, 20, 10]), get_single_char(_), selecao_ranking
    ;   menu_principal
    ).


selecao_fase:-
    tela(fases),
    get_single_char(Comando),
    (   Comando == 49
    ->  write("Carregar Fase python")
    ;   Comando == 50
    ->  write("Carregar Fase Java")
    ;   Comando == 51
    ->  write("Carregar Fase Haskell")
    ;   Comando == 52
    ->  write("Carregar Fase Prolog")
    ;   menu_principal
    ).


main:-
    menu_principal,
    nl, halt.
