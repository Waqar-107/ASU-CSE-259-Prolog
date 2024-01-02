next_to(oregon, california).
next_to(california, oregon).

next_to(california, nevada).
next_to(nevada, california).

next_to(california, arizona).
next_to(arizona, california).

next_to(arizona, new_mexico).
next_to(new_mexico, arizona).

travel(A, C) :- (next_to(A, C) ; (next_to(A, B), next_to(B, C), A \= C)).