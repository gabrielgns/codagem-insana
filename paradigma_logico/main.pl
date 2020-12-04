:- use_module('modulos/telas', [tela/1]).
:- use_module('modulos/telas_dinamicas').
:- use_module('modulos/sorteio_palavras', [sortear_palavras_partida/2]).
:- use_module('modulos/partida').
:- use_module('modulos/persistencia').
:- use_module('modulos/util').
:- use_module('modulos/ranking').


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
    ->  exibir_ranking(python)
    ;   Comando == 50
    ->  exibir_ranking(java)
    ;   Comando == 51
    ->  exibir_ranking(haskell)
    ;   Comando == 52
    ->  exibir_ranking(prolog)
    ;   menu_principal
    ).


exibir_ranking(Linguagem):-
    ler_ranking(Linguagem, Nomes, Pontos),
    tela_ranking(Linguagem, Nomes, Pontos),
    get_single_char(_),
    selecao_ranking.


selecao_fase:-
    tela(fases),
    get_single_char(Comando),
    (   Comando == 49
    ->  jogo(python)
    ;   Comando == 50
    ->  jogo(java)
    ;   Comando == 51
    ->  jogo(haskell)
    ;   Comando == 52
    ->  jogo(prolog)
    ;   menu_principal
    ).


jogo(Linguagem):-
    sortear_palavras_partida(Linguagem, Palavras_partida),
    partida(Palavras_partida, 0, Pontuacao_final),
    ler_ranking(Linguagem, Nomes, Pontos),
    ultimo(Pontos, Ultimo),
    (   Pontuacao_final > Ultimo
    ->  tela(vitoria),
        read_string(user_input, "\n", "\r\t ", _, N),
        sub_string(N, _, 3, _, Nome),
        insere_recorde(Pontuacao_final, Nome, Pontos, Nomes, Novos_pontos, Novos_nomes),
        salvar_ranking(Linguagem, Novos_nomes, Novos_pontos)
    ;   tela(derrota), get_single_char(_)
    ), menu_principal.


main:-
    menu_principal,
    nl, halt.
