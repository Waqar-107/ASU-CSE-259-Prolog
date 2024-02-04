% facts
next_to(california, arizona).
next_to(california, oregon).
next_to(california, nevada).
next_to(arizona, new_mexico).

% a rule where we write the logic of when two states are connected
connected(A, B) :- next_to(A, B) ; next_to(B, A).

/*
 * recusrive rule 
 */
path(A, B) :- connected(A, B).
path(A, B) :- connected(A, C), C \== B, path(C, B).

travel(A, B) :- path(A, B).