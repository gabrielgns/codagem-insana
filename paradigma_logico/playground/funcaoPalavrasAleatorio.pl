ins(X, [], [X]).
ins(X, [H|T], [X,H|T]).
ins(X, [H|T], [H|T2]) :-
    ins(X, T, T2).

palavras(Nome1, R2):-
    random_between(1, Nome1, R3),
    R2 is R3.

num(Num1, R6):-
    R6 is (Num1-1).


palavraAleatoria(ListaLinguagem1, Resultado):-

    length(ListaLinguagem1, Tamanho1),
    palavras(Tamanho1, R1),
    num(R1, R2),
    nth0(R2, ListaLinguagem1, Nome1),
    ins(Nome1, [], Answer1),

    palavras(Tamanho1, R3),
    num(R3, R4),
    nth0(R4, ListaLinguagem1, Nome2),
    ins(Nome2, Answer1, Answer2),

    palavras(Tamanho1, R5),
    num(R5, R6),
    nth0(R6, ListaLinguagem1, Nome3),
    ins(Nome3, Answer2, Answer3),
    ins(Answer3, [], Answer4),


    palavras(Tamanho1, R7),
    num(R7, R8),
    nth0(R8, ListaLinguagem1, Nome4),
    ins(Nome4, [], Answer5),

    palavras(Tamanho1, R8),
    num(R8, R9),
    nth0(R9, ListaLinguagem1, Nome5),
    ins(Nome5, Answer5, Answer6),

    palavras(Tamanho1, R10),
    num(R10, R11),
    nth0(R11, ListaLinguagem1, Nome6),
    ins(Nome6, Answer6, Answer7),
    ins(Answer7, Answer4, Answer8),


    palavras(Tamanho1, R12),
    num(R12, R13),
    nth0(R13, ListaLinguagem1, Nome7),
    ins(Nome7, [], Answer9),

    palavras(Tamanho1, R14),
    num(R14, R15),
    nth0(R15, ListaLinguagem1, Nome8),
    ins(Nome8, Answer9, Answer10),

    palavras(Tamanho1, R16),
    num(R16, R17),
    nth0(R17, ListaLinguagem1, Nome9),
    ins(Nome9, Answer10, Answer11),
    ins(Answer11, Answer8, Answer12),


    length(ListaLinguagem1, Tamanho2),
    palavras(Tamanho2, R18),
    num(R18, R19),
    nth0(R19, ListaLinguagem1, Nome10),
    ins(Nome10, [], Answer13),

    palavras(Tamanho2, R20),
    num(R20, R21),
    nth0(R21, ListaLinguagem1, Nome11),
    ins(Nome11, Answer13, Answer14),
    ins(Answer14,Answer12 , Answer15),

    palavras(Tamanho2, R22),
    num(R22, R23),
    nth0(R23, ListaLinguagem1, Nome12),
    ins(Nome12, [], Answer16),

    palavras(Tamanho2, R24),
    num(R24, R25),
    nth0(R25, ListaLinguagem1, Nome13),
    ins(Nome13, Answer16, Answer17),
    ins(Answer17,Answer15 , Answer18),

    length(ListaLinguagem1, Tamanho3),
    palavras(Tamanho3, R26),
    num(R26, R27),
    nth0(R27, ListaLinguagem1, Nome14),
    ins(Nome14, [], Answer19),
    ins(Answer19,Answer18 , Answer20),

    palavras(Tamanho1, R28),
    num(R28, R29),
    nth0(R29, ListaLinguagem1, Nome15),
    ins(Nome15, [], Answer21),
    ins(Answer21,Answer20 , Answer22),

    Resultado = Answer22.


