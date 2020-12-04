:- module(util,
    [   repete_string/3,
        write_stringr/2,
        centraliza/1,
        centraliza_titulo/2,
        nEspacos/2,
        soma_lista/2,
        pegar_elementos/3,
        remover_elementos/3,
        ultimo/2
    ]
).


% Cria uma string que é constituída de repetições de uma outra string
repete_string(_, 0, "").
repete_string(Str, 1, Str).
repete_string(Str, Repeticoes, Resultado):-
    R1 is Repeticoes - 1,
    repete_string(Str, R1, Resultado_parcial),
    string_concat(Str, Resultado_parcial, Resultado).


% Imprime uma string repetidas vezes
write_stringr(_, 0).
write_stringr(S, N):-
    write(S),
    N1 is N - 1,
    write_stringr(S, N1).


% Centraliza um texto na tela
centraliza(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).


% Centraliza um texto e aplica uma cor e deixa em negrito
centraliza_titulo(Str, Cor):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repete_string(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    ansi_format([bold, bg(Cor)], '~w', [A]).


% Função auxiliar de centraliza
nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).


% Soma todos os valores de uma lista de números
soma_lista([], 0).
soma_lista([H|T], R):-
    soma_lista(T, R1),
    R is H + R1.


% Pega os primeiros N elementos de uma lista
pegar_elementos(0, _, []).
pegar_elementos(N, [A|Y], [A|D]):-
    N2 is N - 1,
    pegar_elementos(N2, Y, D).

% remove N elementos de uma lista
remover_elementos(0, X, X).
remover_elementos(Q, [_|Y], D):-
    Q2 is Q - 1,
    remover_elementos(Q2, Y, D).

ultimo([], []).
ultimo([X], X).
ultimo([_ | T], E):-
    ultimo(T, E).
