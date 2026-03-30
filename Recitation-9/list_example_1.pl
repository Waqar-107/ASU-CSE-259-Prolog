mothers([alice, mary, sarah]).
fathers([john, david, michael]).

my_member(X, [X|_]).
my_member(X, [_|T]) :-
    my_member(X, T).

main(Name) :-
    mothers(Lst),
    my_member(Name, Lst),
    write(mother), !.

main(Name) :-
    fathers(Fathers),
    my_member(Name, Fathers),
    write(father), !.

main(_) :-
    write(none).