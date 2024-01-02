# Lists in Prolog

1. Lists in Prolog is specified using square brackets.
   ```prolog
   [mia, vincent, jules, yolanda]
   ```
2. All sorts of Prolog objects can be elements of a list.
   ```prolog
   [mia, car(toyota), X, 2]
   ```
3. Lists can be empty.
   ```prolog
   []
   ```
4. Lists can contain other lists as elements.
   ```prolog
   [mia, [apple, banana], [toyota, honda]]
   ```

5. Lists can have two parts, `head` and `tail`. The first element is head, and the rest of the part is tail.
   ```prolog
   [Head | Tail] = [mia, vincent, jules, yolanda].

   H = mia
   T = [vincent, jules, yolanda]
   ```

6. The head and the tail can have any name like variables.
   ```prolog
   [X | Y] = [1, 2, 5, []].

   X = 1
   Y = [2, 5, []]
   ```

7. Only non-empty lists have head and tail.
   ```prolog
   [X | Y] = [].

   % this will show no
   ```

8. Extracting the first two elements from a list.
   ```prolog
   [X, Y | W] = [[], dead(z), [2, [b, c]], [], Z].

   W = [[2, [b, c]], [], Z]
   X = []
   Y = dead(z)
   ```

9. Suppose we want to get the 2nd and the 4th element of the list!
   ```prolog
   [X1, X2, X3, X4 | Tail] = [[], dead(z), [2, [b, c]], [], Z].

   Tail = [Z]
   X1 = []
   X2 = dead(z)
   X3 = [2, (b, c)]
   X4 = []
   ```

   Instead of binding the values to so many variables, let's use `Anonymous variables`.
   ```prolog
   [_, X2, _, X4 | _] = [[], dead(z), [2, [b, c]], [], Z].

   X2 = dead(z)
   X4 = []
   ```
10. Extracting elements from a list that is inside another list. Suppose inside a list the 5th member is another list and we want to extract the 1st and 3rd member of that list.
    ```prolog
    [_, _, _, _, [X1, _, X3 | _] | _] = [[], 1, 2, 5, [90, 93, 94, 97, 99], 100, dead(monkey)].

    X1 = 90
    X3 = 94
    ```
