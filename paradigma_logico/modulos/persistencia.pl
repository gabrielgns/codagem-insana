:- module(persistencia, [salvar_ranking/3, ler_ranking/3, ler_linguagem/2]).

:- use_module(util, [remover_por_indice/3]).

arquivo_ranking(python, Arquivo):- Arquivo = './rankings/python.txt'.
arquivo_ranking(java, Arquivo):- Arquivo = './rankings/java.txt'.
arquivo_ranking(haskell, Arquivo):- Arquivo = './rankings/haskell.txt'.
arquivo_ranking(prolog, Arquivo):- Arquivo = './rankings/prolog.txt'.

arquivo_palavras(python, Arquivo):- Arquivo = './palavras_reservadas/python.txt'.
arquivo_palavras(java, Arquivo):- Arquivo = './palavras_reservadas/java.txt'.
arquivo_palavras(haskell, Arquivo):- Arquivo = './palavras_reservadas/haskell.txt'.
arquivo_palavras(prolog, Arquivo):- Arquivo = './palavras_reservadas/prolog.txt'.


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
    arquivo_ranking(Linguagem, Arquivo),
	open(Arquivo, write, Stream),
	salvar_nomes(Nomes, Stream),
    salvar_lista(Pontuacoes, Stream),
    write(Stream, '\n'),
	close(Stream).


ler_ranking(Linguagem, Nomes, Pontos):-
    arquivo_ranking(Linguagem, Arquivo),
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


ler_linguagem(Linguagem, Palavras):-
    arquivo_palavras(Linguagem, Arquivo),
    open(Arquivo, read, Stream),
    read_string(Stream, "", "\n", _, String),
    split_string(String, "\n", ".", Palavras).
