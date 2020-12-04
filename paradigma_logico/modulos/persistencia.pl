:- module(persistencia, [salvar_ranking/3, ler_ranking/3]).

arquivo(python, Arquivo):- Arquivo = './rankings/python.txt'.
arquivo(java, Arquivo):- Arquivo = './rankings/java.txt'.
arquivo(haskell, Arquivo):- Arquivo = './rankings/haskell.txt'.
arquivo(prolog, Arquivo):- Arquivo = './rankings/prolog.txt'.


salvar_lista([], _).
salvar_lista([H| T], Stream):-
    atom_concat(H, '.\n', Linha),
    write(Stream, Linha),
    salvar_lista(T, Stream).


salvar_nomes([], _).
salvar_nomes([H| T], Stream):-
    string_lower(H, Nome),
    atom_concat(Nome, '.\n', Linha),
    write(Stream, Linha),
    salvar_nomes(T, Stream).


nomes_upper([], []).
nomes_upper([N | T], [Nome| X]):-
    string_upper(N, Nome),
    nomes_upper(T, X).


salvar_ranking(Linguagem, Nomes, Pontuacoes):-
    arquivo(Linguagem, Arquivo),
	open(Arquivo, write, Stream),
	salvar_nomes(Nomes, Stream),
    salvar_lista(Pontuacoes, Stream),
    write(Stream, '\n'),
	close(Stream).


ler_ranking(Linguagem, Nomes, Pontos):-
        arquivo(Linguagem, Arquivo),
        open(Arquivo, read, Stream),
        read(Stream, N1),
        read(Stream, N2),
        read(Stream, N3),
        nomes_upper([N1, N2, N3], Nomes),
        read(Stream, P1),
        read(Stream, P2),
        read(Stream, P3),
        Pontos = [P1, P2, P3],
        close(Stream).


main:-
        salvar_ranking(java, ["JOA", "MAR", "LUI"], [30, 20, 10]),
        salvar_ranking(haskell, ["JOA", "MAR", "LUI"], [30, 20, 10]),
        salvar_ranking(prolog, ["JOA", "MAR", "LUI"], [30, 20, 10]),
        ler_ranking(python, N, P),
        write(N), nl,
        write(P), nl.
