:- module(telas, [tela/0]).

:- use_module(utils, [repete_string/3, write_stringr/2]).

% Títulos das telas
textos(vitoria, T):- T = "Chegou a sua hora de entrar para o ranking dos mais INSANOS".
textos(ranking, T):- T = "Rankings".
textos(derrota, T):- T = "Você ainda não é INSANO o suficiente".

% Telas
tela(limpa):- limpa_tela.
tela(menu):- tela_menu_principal.
tela(fases):- tela_selecao_fase.
tela(rankings):- tela_selecao_ranking.
tela(vitoria):- tela_vitoria.
tela(derrota):- tela_derrota.

% Início do código para centralizar
nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).

centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).

centralizar_color_red(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold,bg(red)], '~w', [A]).

centralizar_color_cyan(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade) - 1,Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold,bg(cyan)], '~w', [A]).


% Código para renderizar as telas
limpa_tela:- write('\e[H\e[2J').


tela_menu_principal:-
    limpa_tela,
    write_stringr("\n", 6),
    centralizar_color_red("Codagem Insana"), nl,
    centralizar("[1] - Iniciar Jogo  "), nl,
    centralizar("[2] - Ranking       "), nl,
    centralizar("[q] - Sair do Jogo  "), nl,
    write_stringr("\n", 10).


tela_selecao_fase:-
    limpa_tela,
    write_stringr("\n", 7),
    repete_string(" ", 27, T),
    string_concat(T, "Seleção de Fase", Titulo1),
    string_concat(Titulo1, T, Titulo2),
    ansi_format([bold,bg(red)], '~w', [Titulo2]), nl,
    centralizar("[1] - Python        "), nl,
    centralizar("[2] - Java          "), nl,
    centralizar("[3] - Haskell       "), nl,
    centralizar("[4] - Prolog        "), nl,
    centralizar("[_] - Menu Principal"), nl,
    write_stringr("\n", 8).


tela_selecao_ranking:-
    limpa_tela,
    write_stringr("\n", 6),
    centralizar_color_cyan("Rankings"), nl,
    centralizar("[1] - Python        "), nl,
    centralizar("[2] - Java          "), nl,
    centralizar("[3] - Haskell       "), nl,
    centralizar("[4] - Prolog        "), nl,
    centralizar("[_] - Menu Principal"), nl,
    write_stringr("\n", 8).


tela_vitoria:-
    limpa_tela,
    write_stringr("\n", 9),
    textos(vitoria, Texto_vitoria),
    centralizar_color_cyan(Texto_vitoria), nl,
    write_stringr("\n", 9),
    write("Digite o seu nome (3 letras): ").


tela_derrota:-
    limpa_tela,
    write_stringr("\n", 9),
    textos(derrota, T),
    centralizar_color_red(T), nl,
    write_stringr("\n", 8),
    centralizar("Aperte qualquer tecla para voltar para o menu").

% Main para testes. Tem que adicionar o main
% nos predicados exportados para poder usá-lo
main:-
    tela(vitoria),
    read(Nome),
    write(Nome),
    get_single_char(_),
    tela(derrota),
    get_single_char(_),
    tela(menu),
    get_single_char(_),
    tela(fases),
    get_single_char(_),
    tela(rankings),
    get_single_char(_),
    nl, halt.
