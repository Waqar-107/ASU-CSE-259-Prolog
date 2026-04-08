%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             ASU CSE 259 Logic in CS           %%
%%                    Project 3                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% setting the binding priority for the logic connectives; the lower the tighter.
:-op(700,xfy,=>).
:-op(650,xfy,->).
:-op(600,xfy,v).
:-op(500,xfy,^).
:-op(450,fy,~).

%
% type 'run([<Premises as a list>], [<A formula as the conclusion>]). E.g., run([p ^ q], [p])' to start
%

run(Premises, Conclusion) :-
  write(Premises => Conclusion),
  deduce(Premises => Conclusion).


deduce(X) :-
  prove(X), !,
  write('\n\nWe can derive the conclusion from the premises.\n').
deduce(X) :-
  write('\n=\tCannot be proved.'),
  write('\n\nWe cannot derive the conclusion from the premises.\n\nAn interpretation of the signature where this does not hold:'),
  reduce(X).


% predicate to delete an element X from a list L.
del(X, [X | Tail], Tail).
del(X, [H | Tl1 ], [H | Tl2]) :- del(X, Tl1, Tl2).


% remove duplicate formulas in a list
rmvDup([], []).
rmvDup([H | Tail], [H | Tail1]) :-
  \+member(H, Tail),
  rmvDup(Tail, Tail1).
rmvDup([H | Tail], Tail1):-
  member(H, Tail),
  rmvDup(Tail, Tail1).


%%%%%%%%%%%%%%%% YOUR CODE STARTS %%%%%%%%%%%%%%%%

% Implement all other non-branching rules below by following Wangs algorithm

/*
 * Rule-1
 * example rule: negation
 * non-branching rule
 * If one of the formulae separated by commas is the
 * negation of a formula, drop the negation sign and
 * move it to the other side of the arrow.
 */
prove(L => R):-
    member(~X, L),
    del(~X, L, NewL),
    nl, write('=\t'), write(NewL => [X | R]),
    write('\t (by negation/left)'),
    prove(NewL => [X | R]).
prove(L => R):-
    member(~X, R),
    del(~X, R, NewR),
    nl, write('=\t'), write([X | L] => NewR),
    write('\t (by negation/right)'),
    prove([X | L] => NewR).


/*
 * Rule-2
 * non-branching rule
 * If the last connective of a formula on the left is ^ (and),
 * or on the right of the arrow is v (or), replace the connective by a comma.
 */

% left conjuction
prove(L => R) :-
  member(A ^ B, L),
  del(A ^ B, L, NewL),
  nl, write('=\t'), write([A, B | NewL] => R),
  write('\t (by and/left)'),
  prove([A, B | NewL] => R).

% right disjunction
prove(L => R) :-
  member(A v B, R),
  del(A v B, R, NewR),
  nl, write('=\t'), write(L => [A, B | NewR]),
  write('\t (by or/right)'),
  prove(L => [A, B | NewR]).


/*
 * Rule-3
 * non-branching rule
 * If the last connective of a formula on the right is A ➝ B, remove A ➝ B from the right 
 * and then add A to the left and B to the right.
 */
% Write your code here


% Implement all branching rules below by following Wangs algorithm
/*
 * Rule-4
 * branching rule
 * If the last connective of a formula on the left is v (or), or on the right of the arrow is ^ (and), 
 * then produce two new lines, each with one of the two sub formulae replacing the formula. 
 * Both of these must be proved in order to prove the original theorem.
 */
% Write your code here



/*
 * Rule-5
 * example rule: left implication
 * branching rule
 * If the last connective of a formula on the left is A ➝ B,
 * remove A ➝ B from the left and then create two new lines, 
 * one with B added to the left, and the other with A added to the right.
 */
prove(L => R) :-
  member(A -> B, L),
  del(A -> B, L, NewL),
  nl,
  write('\tFirst branch: '),
  nl,
  write('=\t'),
  write([B | NewL] => R),
  write('\t (by arrow/left)'),
  prove([B | NewL] => R),
  nl,
  write('\tSecond branch: '),
  nl,
  write('=\t'),
  write(NewL => [A | R]),
  write('\t (by arrow/left)'),
  prove(NewL => [A | R]).

%%%%%%%%%%%%%%%% YOUR CODE ENDS %%%%%%%%%%%%%%%%


% rule for checking shared atom or formula
prove(L => R):-
    member(X, L),
    member(X, R),
    nl, write('=\tDone (sharing a/f)').


% reduces expression so you can print out what the false stuff is
reduce(L => R):-
    member(~X,L),
    del(~X,L,NewL),
    reduce(NewL => [X|R]).      %negation left
reduce(L => R):-
    member(~X,R),
    del(~X,R,NewR),
    reduce([X|L] => NewR).      %negation right
reduce(L => R):-
    member(A ^ B,L),
    del(A ^ B,L,NewL),
    reduce([A,B|NewL] => R).    %and/left
reduce(L => R):-
    member(A v B,R),
    del(A v B,R,NewR),
    reduce(L => [A,B|NewR]).    %or/right
reduce(L => R):-
    member(A -> B,R),
    del(A -> B,R,NewR),
    reduce([A|L] => [B|NewR]).  %arrow/right
reduce(L => R):-
    member(A ^ B,R),
    del(A ^ B,R,NewR),
    reduce(L => [A|NewR]),
    reduce(L => [B|NewR]).      %and/right
reduce(L => R):-
    member(A v B,L),
    del(A v B,L,NewL),
    reduce([A|NewL] => R),
    reduce([B|NewL] => R).      %or/left
reduce(L => R):-
    member(A -> B,L),
    del(A -> B,L,NewL),
    reduce([B|NewL] => R),
    reduce(NewL => [A|R]).      %arrow/left
reduce(L => R):-
    member(X,L),
    member(X,R).
reduce(L => R):-
    rmvDup(L, NewL),
    rmvDup(R, NewR),
    write('\nSetting '),write(NewL),
    write(' as True, and '),write(NewR),write(' as False.').
