:- module(telas, [tela/1]).

:- use_module(util, [repete_string/3, write_stringr/2, centraliza/1, centraliza_titulo/2]).

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


% Predicados para renderizar as telas
limpa_tela:- write('\e[H\e[2J').


tela_menu_principal:-
    limpa_tela,
    write_stringr("\n", 6),
    centraliza_titulo("Codagem Insana", red), nl,
    centraliza("[1] - Iniciar Jogo  "), nl,
    centraliza("[2] - Ranking       "), nl,
    centraliza("[q] - Sair do Jogo  "), nl,
    write_stringr("\n", 10).


tela_selecao_fase:-
    limpa_tela,
    write_stringr("\n", 6),
    repete_string(" ", 27, T),
    string_concat(T, "Seleção de Fase", Titulo1),
    string_concat(Titulo1, T, Titulo2),
    ansi_format([bold,bg(red)], '~w', [Titulo2]), nl,
    centraliza("[1] - Python        "), nl,
    centraliza("[2] - Java          "), nl,
    centraliza("[3] - Haskell       "), nl,
    centraliza("[4] - Prolog        "), nl,
    centraliza("[_] - Menu Principal"), nl,
    write_stringr("\n", 9).


tela_selecao_ranking:-
    limpa_tela,
    write_stringr("\n", 6),
    centraliza_titulo("Rankings", cyan), nl,
    centraliza("[1] - Python        "), nl,
    centraliza("[2] - Java          "), nl,
    centraliza("[3] - Haskell       "), nl,
    centraliza("[4] - Prolog        "), nl,
    centraliza("[_] - Menu Principal"), nl,
    write_stringr("\n", 8).


tela_vitoria:-
    limpa_tela,
    write_stringr("\n", 9),
    textos(vitoria, Texto_vitoria),
    centraliza_titulo(Texto_vitoria, cyan), nl,
    write_stringr("\n", 9),
    write("Digite o seu nome (3 letras): ").


tela_derrota:-
    limpa_tela,
    write_stringr("\n", 9),
    textos(derrota, Titulo),
    centraliza_titulo(Titulo, red), nl,
    write_stringr("\n", 8),
    centraliza("Aperte qualquer tecla para voltar para o menu").

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
