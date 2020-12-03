ordena([PosicaoUm], UmElemento):-
    UmElemento = PosicaoUm.

ordena([PosicaoUm, PosicaoDois], DoisElementos):-
    sort([PosicaoUm, PosicaoDois], ListaOrdenada),
    reverse(ListaOrdenada, Inversa),
    [Primeiro, Segundo] = Inversa,
    DoisElementos = [Primeiro, Segundo].

ordena(ParNomePontuacao, TresPrimeiros):-
    sort(ParNomePontuacao, ListaOrdenada),
    reverse(ListaOrdenada, Inversa),
    [Primeiro, Segundo, Terceiro|_] = Inversa,
    TresPrimeiros = [Primeiro, Segundo, Terceiro].

main:- ordena([(10, abc), (1, x), (100, gabriel), (500, joaozinho), (50, z)], TresPrimeiros),
    write(TresPrimeiros), nl, halt.