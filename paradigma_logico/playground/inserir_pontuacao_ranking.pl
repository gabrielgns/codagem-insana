escrever(Nome, Pontuacao):-
    open('ranking.txt', write, Out),
    concat(Nome, "  ->   ", Parte1),
    concat(Parte1, Pontuacao, Final),
    write(Out, Final),
    close(Out).   

ler:-
    open('ranking.txt',read,In),
    repeat,
    read_line_to_codes(In,X),writef(" "),
    writef(X),nl,
    X=end_of_file,!,
    nl,
    close(In).

main:- read(Nome),
    read(Pontuacao),
    escrever(Nome, Pontuacao).