:- module(utils,
    [   repete_string/3,
        write_stringr/2
    ]
).


%
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
