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
    ansi_format([bold,bg(green)], '~w', [A]).


ranking(Nome, Lista_nomes, Lista_pontuacoes):-
    nth0(0, Lista_nomes, Nome1),
    nth0(1, Lista_nomes, Nome2),
    nth1(3, Lista_nomes, Nome3),

    nth0(0, Lista_pontuacoes, Pontuacao1),
    nth0(1, Lista_pontuacoes, Pontuacao2),
    nth1(3, Lista_pontuacoes, Pontuacao3),

    atom_concat("Ranking da Linguagem ", Nome,Answer1),
    repeat("\n",7,Res),
    write(Res),
    centralizar_color(Answer1), nl, nl,

    atom_concat("1. ", Nome1 ,Answer15),
    string_concat(Answer15, " .......... " ,Answer16),
    string_concat(Answer16, Pontuacao1 ,Answer17),
    centralizar(Answer17), nl,

    string_concat("2. " ,Nome2, Answer18),
    string_concat(Answer18, " .......... " ,Answer19),
    string_concat(Answer19, Pontuacao2 ,Answer20),
    centralizar(Answer20), nl,

    string_concat("3. ", Nome3,Answer21),
    string_concat(Answer21, " .......... " ,Answer22),
    string_concat(Answer22, Pontuacao3 ,Answer23),
    centralizar(Answer23), nl,

    repeat("\n",9,R),
    write(R).


main:-
    ranking("Prolog", ["lucas", "amanda", "eloisa"], [10, 9, 8]).

