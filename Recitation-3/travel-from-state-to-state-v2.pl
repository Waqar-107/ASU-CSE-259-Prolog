next_to(california, arizona).
next_to(california, oregon).
next_to(california, nevada).
next_to(arizona, new_mexico).

connected(A, B) :- next_to(A, B) ; next_to(B, A).

/*
 * recusrive rule 
 */
path(A, B) :- connected(A, B).
path(A, B) :- connected(A, C), C \== B, path(C, B).

travel(A, B) :- path(A, B).