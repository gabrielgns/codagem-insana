escrever(NomePontuacao):-
    open('ranking.txt', write, Out),
    ordena(NomePontuacao, TresPrimeiros),
    [Primeiro, Segundo, Terceiro|_] = TresPrimeiros,
    
    Primeiro = (Num1, Nome1),
    concat(Nome1, "  ->   ", Parte11),
    concat(Parte11, Num1, Parte12),
    concat(Parte12, "\n", Final),
    
    Segundo = (Num2, Nome2),
    concat(Nome2, "  ->   ", Parte21),
    concat(Parte21, Num2, Parte22),
    concat(Parte22, "\n", Final2),
    
    Terceiro = (Num3, Nome3),
    concat(Nome3, "  ->   ", Parte31),
    concat(Parte31, Num3, Parte32),
    concat(Parte32, "\n", Final3),
    
    write(Out, Final),
    write(Out, Final2),
    write(Out, Final3),
    close(Out).   

ler:-
    open('ranking.txt',read,In),
    repeat,
    read_line_to_codes(In,X),writef(" "),
    writef(X),nl,
    X=end_of_file,!,
    nl,
    close(In).

ordena(ParNomePontuacao, TresPrimeiros):-
    sort(ParNomePontuacao, ListaOrdenada),
    reverse(ListaOrdenada, Inversa),
    [Primeiro, Segundo, Terceiro|_] = Inversa,
    TresPrimeiros = [Primeiro, Segundo, Terceiro].

main:-
    escrever([(20, gabriel), (2000, joaozinho), (206, maria), (100, guilherme)]).