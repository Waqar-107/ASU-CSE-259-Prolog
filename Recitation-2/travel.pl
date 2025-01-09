% facts
next_to(oregon, california).
next_to(california, oregon).

next_to(california, nevada).
next_to(nevada, california).

next_to(california, arizona).
next_to(arizona, california).

next_to(arizona, new_mexico).
next_to(new_mexico, arizona).


% rule - when can we travel from state A to state C?
travel(A, C) :- (
  next_to(A, C);
  (next_to(A, B), next_to(B, C), A \= C)
).

% if A and C are next to each other
% OR
% if there is a state B which is next to A and next C then we can use B to travel from A to C and vice-versa