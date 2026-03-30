numbers([5, 12, 7, 20, 9]).

index_of(X, [X|_], 0).
index_of(X, [_|T], Index) :-
    index_of(X, T, RestIndex),
    Index is RestIndex + 1.

% ( Condition -> Then ; Else )
main(Number) :-
    numbers(List),
    (index_of(Number, List, Index) ->  write(Index) ; write(null)).