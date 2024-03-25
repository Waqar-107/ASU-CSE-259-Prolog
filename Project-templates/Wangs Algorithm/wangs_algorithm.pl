%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             ASU CSE 259 Logic in CS           %%
%%             Project Submission File           %%
%%                   thmpv.py                    %%
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


% Implement all branching rules below by following Wangs algorithm

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
