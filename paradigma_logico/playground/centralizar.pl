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

main:-
    centralizar("lucas"),
    get_char(C).


