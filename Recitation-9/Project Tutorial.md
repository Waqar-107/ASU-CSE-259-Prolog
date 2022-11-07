## Important rules to use while coding

1. Deleting anything from the list
   ```prolog
   del(X, [X | Tail], Tail).
   del(X, [H | Tail1], [H | Tail2]) :- del(X, Tail1, Tail2).
   ```
   
   Consider that we have used it like this, `del(a, [z, y, w, a, b, c, d, e], A).`. The calling and returning will be like the following figure.

   <img src="./assets/project-3-del.png" width="500" height="200"/>

   We start by passing a variable **A** to the third parameter in the rule. Until our desired element is found in the head of the list, the second rule will be used. In the second rule, extract the head out and pass the tail for the next call. Also, we have defined that the variable **A** will have the same head as the list and the tail of it will be a variable. So, when the calling of the rule comes back with a possible value of the tail, the **H** is appened at the first and then returned. 


2. Checking whether an element is a member of the list. We use it like this, `member(?Elem, ?List)`. Pass an element and a list and you will get `true` if the element is a member of the list. Else prolog will return `false`.


## Sample codes explanation
We need to implement the rules from Wangs algorithm. Some of the rules are already implemented.

1. The rule marked as **b** in the slides, that is `If one of the formulae separated by commas is the negation of a formula, drop the negation sign and move it to the other side of the arrow` is implemented in the code.
   ```prolog
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
   ```

   In the first rule, we try checking whether if something with negation is on the premises (left side). If yes then delete it and modify the conclusions (right side) appending with it.

   In the second rule, we assume that something with negation is on the conclusions (right). So, we delete it from the right and append it with the premises (left).

   **Considering the premise and the conclusion as lists**.

2. The rule marked as **c** in the slides, that is `If the last connective of a formula on the left is ^ (and), or on the right of the arrow is v (or), replace the connective by a comma.` is partially implemented in the code.

   ```prolog
   prove(L => R) :-
     member(A ^ B, L),
     del(A ^ B, L, NewL),
     nl, write('=\t'), write([A, B | NewL] => R),
     write('\t (by and/left)'),
     prove([A, B | NewL] => R).

   prove(L => R) :-
     member(A v B, R),
     del(A v B, R, NewR),
     nl write('=\t'), write(L => [A, B | NewR]),
     write('\t (by or/right)'),
     prove(L => [A, B | NewR]).
   ```

   So, we check if there's something in the form `A ^ B` we delete it and add `A, B`. Similarly we handle something in the form `A v B` in the right.
  
3. Write the tule **f** that is, `If the last connective of a formula on the left is A ➝ B, remove A ➝ B from the left and then create two new lines, one with B added to the left, and the other with A added to the right.` like this following the slides.
   ```prolog
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
   ```