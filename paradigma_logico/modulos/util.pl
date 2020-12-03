:- module(util,
    [   repete_string/3,
        write_stringr/2,
        soma_lista/2,
        centralizar/1
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


% centraliza um texto na tela
centralizar(Str):-
    atom_length(Str,Tamanho_string),
    nEspacos(Tamanho_string, Quantidade),
    repeat(" ",integer(Quantidade),Res),
    atom_concat(Res, Str ,Answer),
    atom_concat(Answer, Res ,A),
    write(A).


% Função auxiliar de centralizar
nEspacos(Tamanho_string, Quantidade):-
    Quantidade is 35 - (Tamanho_string / 2).


% Soma todos os valores de uma lista de números
soma_lista([], 0).
soma_lista([H|T], R):-
    soma_lista(T, R1),
    R is H + R1.
