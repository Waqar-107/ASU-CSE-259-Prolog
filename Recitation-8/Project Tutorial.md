# Chess

## Task-3

### What do we have here?
So for Task-3, we are given the following piece of code. We have also been instructed where to change.

```prolog
% ------------------------------------------------------------------------------
% YOUR CODE STARTS HERE

% TASK 3: MODIFY THE CODE BELOW TO MAKE playerA and playerB auto-compete.
play(Board) :-
    get_command(Command),
    execute_command(Command, Board, NewBoard),
    execute_command(playerB, NewBoard, NextNewBoard),
    play(NextNewBoard).

get_command(Command) :-
    nl, write('white move -> '),
    read(Command), !.

execute_command(Move, Board, NewBoard) :-
         parse_move(Move, From, To),
         move(Board, From, To, white, Piece),
         make_move(Board, From, To, NewBoard), !.

execute_command(Player, Board, NewBoard) :-
    respond_to(Player, Board, NewBoard), !.

execute_command(X, Board, _) :-     % Use to catch unexpected situations
    write('What?'),
    halt(0).

% ------------------------------------------------------------------------------
% YOUR CODE ENDS HERE
```

### What is happening here?
- When `play(Board)` is being called, we are asking for the user to enter a move. This will be the move of the playerA aka the White. We are using `get_command(Command)` to fetch the input from the user and after that we are executing it.
- We have 3 `execute_command` rule here. 
  - The first one is for executing moves that are **given manually by the user**. 
  - The second one is for executing moves automatically. So, as we know that playerB's move has already been implemented, We are passing the player name here so that the move gets executed.
  - **The last one is to handle unexpected situation**. So that our code does not crash.

### What do we need to do? 
- For Task-3, we have been asked to modify the code so that playerA and playerB auto-competes.
- What we will do here is,
  - Stop calling the rule that gets the user input. 
  - When calling `execute_command` for playerA, instead of passing a variable like `Command`, **just pass the atom playerA**.
- Check out the code changes shown in the slides (recitation-8). **The red marked line is the required change.**

  <img src="./assets/chess-task-3-0.png" alt="" height="150" width="750"/>