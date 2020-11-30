repeat(Str,1,Str).

repeat(Str,Num,Res):-
    Num1 is Num-1,
    repeat(Str,Num1,Res1),
    string_concat(Str, Res1, Res).


tela_menu_principal:-
   limpa,
   repeat("\n",7,Res),
   write(Res),
   ansi_format([bold,bg(red)], '~w', ["Codagem Insana"]), nl,
   write("[1] - Iniciar Jogo"), nl,
   write("[2] - Ranking"), nl,
   write("[q] - Sair do Jogo "), nl,
   repeat("\n",9,R),
   write(R).
   /* write("\n\n\n\n\n\n\n\n"). */

limpa:- write('\e[H\e[2J').


main:-
   tela_menu_principal,
   get_char(C).











