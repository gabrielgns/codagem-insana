get_date_time_value(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).

ins(X, [], [X]).
ins(X, [H|T], [X,H|T]).
ins(X, [H|T], [H|T2]) :-
    ins(X, T, T2).

main:-
    get_date_time_value(second,S), 
    
    read(I),
    
    %sleep de 10 segundos
    sleep(10),
    get_date_time_value(second,S2), 
    
    ins(S, [], L),
    ins(S2, [], L12),

    nth0(0, L, IT),
    nth0(0, L12, FT),
     
    T is (FT - IT),
    
    write(T).
get_date_time_value(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).

time_difference(K, T, [H, M, S]) :-
    nth0(0, K, H1),
    nth0(1, K, M1),
    nth0(2, K, S1),

    nth0(0, T, H2),
    nth0(1, T, M2),
    nth0(2, T, S2),

    H3 is H1 - H2,
    M3 is M1 - M2,
    S3 is S1 - S2,
    (S3 < 0 ->
        M4 is M3 - 1,
        S is S3 + 60
        ;
        M4 = M3,
        S = S3),
    (M4 < 0 ->
        M is M4 + 60,
        H is H3 - 1
        ;
        H = H3,
        M = M4).


main:-
    get_date_time_value(hour,H),
    get_date_time_value(second,S),
    get_date_time_value(minute,M),

    read(INP),
    /*
    sleep de 10 segundos
    sleep(10),
    */
    get_date_time_value(hour,H2),
    get_date_time_value(second,S2),
    get_date_time_value(minute,M2),

    nth0(0, LS, ITS),
    nth0(0, LS2, FTS),

    nth0(0, LM, ITM),
    nth0(0, LM2, FTM),

    time_difference([H2,M2,S2], [H,M,S], R),

    nth0(2, R, SEGS),
    nth0(1, R, MINS),

    TEMPO is (MINS * 60) + SEGS,

    write(TEMPO).