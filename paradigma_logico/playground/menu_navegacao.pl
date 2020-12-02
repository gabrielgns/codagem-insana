limpa_tela:- write('\e[H\e[2J').

% Início do código para centralizar
repeat(Str,1,Str).

repeat(Str,Num,Res):-
    Num1 is Num-1,
    repeat(Str,Num1,Res1),
    string_concat(Str, Res1, Res).

nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).

centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).

centralizar_color(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold,bg(red)], '~w', [A]).
% Fim do código para centralizar

menu_principal:-
    limpa_tela,
    repeat("\n", 7, Espacos),
    write(Espacos),
    centralizar_color("Codagem Insana"), nl,
    centralizar("[1] - Iniciar Jogo"), nl,
    centralizar("[2] - Ranking"), nl,
    centralizar("[q] - Sair do Jogo "), nl,
    repeat("\n",9,R),
    write(R),
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
