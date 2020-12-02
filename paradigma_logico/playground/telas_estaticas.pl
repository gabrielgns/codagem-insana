% Constantes
textos(vitoria, T):- T = "Chegou a sua hora de entrar para o ranking dos mais INSANOS".
textos(ranking, T):- T = "Ranking".
textos(derrota, T):- T = "Você ainda não é INSANO o suficiente".


repeat(Str,1,Str).

repeat(Str,Num,Espacos):-
    Num1 is Num-1,
    repeat(Str,Num1,Espacos1),
    string_concat(Str, Espacos1, Espacos).

% Início do código para centralizar
nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).

centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).

centralizar_color_red(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold,bg(red)], '~w', [A]).

centralizar_color_cyan(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold,bg(cyan)], '~w', [A]).
% Fim do código para centralizar


tela_menu_principal:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    centralizar_color_red("Codagem Insana"), nl,
    centralizar("[1] - Iniciar Jogo  "), nl,
    centralizar("[2] - Ranking       "), nl,
    centralizar("[q] - Sair do Jogo  "), nl,
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
    centralizar("[1] - Python        "), nl,
    centralizar("[2] - Java          "), nl,
    centralizar("[3] - Haskell       "), nl,
    centralizar("[4] - Prolog        "), nl,
    centralizar("[_] - Menu Principal"), nl,
    repeat("\n", 8, R),
    write(R).

tela_selecao_ranking:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    centralizar_color_cyan("Rankings"), nl,
    centralizar("[1] - Python        "), nl,
    centralizar("[2] - Java          "), nl,
    centralizar("[3] - Haskell       "), nl,
    centralizar("[4] - Prolog        "), nl,
    centralizar("[_] - Menu Principal"), nl,
    repeat("\n",9,R),
    write(R).

tela_vitoria(Nome):-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    textos(vitoria, T),
    centralizar_color_cyan(T), nl,
    centralizar("Digite o seu nome (3 letras): "), nl,
    write(Espacos),
    read(Nome).
    %read_string(3, Nome), nl.
    %sub_string(N2, 0, 3, _, Nome).

tela_derrota:-
    limpa,
    repeat("\n", 7, Espacos),
    write(Espacos),
    textos(derrota, T),
    centralizar_color_red(T), nl,
    write(Espacos),
    centralizar("Aperte qualquer tecla para voltar para o menu").


main:-
   tela_vitoria("NAME"),
   get_single_char(_),
   nl, halt.
