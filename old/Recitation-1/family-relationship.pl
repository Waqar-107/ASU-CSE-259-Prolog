% facts
mother(ana).
mother(casey).
mother(grace).

father(bob).
father(dan).
father(esion).
father(frank).

% rules
female(X) :- mother(X).
male(Y) :- father(Y).