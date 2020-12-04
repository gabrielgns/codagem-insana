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

    get_date_time_value(second,S2), 
    
    ins(S, [], L),
    ins(S2, [], L12),

    nth0(0, L, IT),
    nth0(0, L12, FT),
     
    T is (FT - IT),
    
    write(T).