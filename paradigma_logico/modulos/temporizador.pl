:- module(temporizador, [tempo/1, diferenca_tempo/3]).


tempo([M, S]):-
    captura_tempo(second, S),
    captura_tempo(minute, M).


diferenca_tempo([M1, S1], [M0, S0], Diff):-
    T1 is (M1 * 60) + S1,
    T0 is (M0 * 60) + S0,
    Diff is T1 - T0.


captura_tempo(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).
