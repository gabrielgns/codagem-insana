:- module(temporizador, [tempo/2]).


tempo(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).


main:-
    tempo(second, T0),
    read(I),
    tempo(second, T1),
    T is T1 - T0,
    write(T).
