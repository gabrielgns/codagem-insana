% Constantes
textos(vitoria, T):- T = "Chegou a sua hora de entrar para o ranking dos mais INSANOS".
textos(ranking, T):- T = "Ranking".
textos(derrota, T):- T = "Você ainda não é INSANO o suficiente".


repeat(Str,1,Str).

repeat(Str,Num,Espacos):-
    Num1 is Num-1,
    repeat(Str,Num1,Espacos1),
    string_concat(Str, Espacos1, Espacos).


tela_menu_principal:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    ansi_format([bold,bg(red)], '~w', ["Codagem Insana"]), nl,
    write("[1] - Iniciar Jogo"), nl,
    write("[2] - Ranking"), nl,
    write("[q] - Sair do Jogo "), nl,
    repeat("\n",9,R),
    write(R).

limpa:- write('\e[H\e[2J').

tela_selecao_fase:-
    limpa,
    repeat("\n", 6, Espacos),
    write(Espacos),
    repeat(" ", 27, T),
    %write(T),
    string_concat(T, "Seleção de Fase", Titulo1),
    string_concat(Titulo1, T, Titulo2),
    ansi_format([bold,bg(red)], '~w', [Titulo2  ]), nl,
    write("[1] - Python"), nl,
    write("[2] - Java"), nl,
    write("[3] - Haskell"), nl,
    write("[4] - Prolog"), nl,
    write("[_] - Menu Principal"), nl,
    repeat("\n", 8, R),
    write(R).

tela_selecao_ranking:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    ansi_format([bold,bg(cyan)], '~w', ["Rankings"]), nl,
    write("[1] - Python"), nl,
    write("[2] - Java"), nl,
    write("[3] - Haskell"), nl,
    write("[4] - Prolog"), nl,
    write("[_] - Menu Principal"), nl,
    repeat("\n",9,R),
    write(R).

tela_vitoria(Nome):-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    textos(vitoria, T),
    ansi_format([bold,bg(cyan)], '~w', [T]), nl,
    write("Digite o seu nome (3 letras): "), nl,
    write(Espacos),
    read(Nome).
    %read_string(3, Nome), nl.
    %sub_string(N2, 0, 3, _, Nome).

tela_derrota:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    textos(derrota, T),
    ansi_format([bold,bg(red)], '~w', [T]), nl,
    write(Espacos),
    write("Aperte qualquer tecla para voltar para o menu").


main:-
   tela_derrota,
   get_single_char(_),
   nl, halt.
