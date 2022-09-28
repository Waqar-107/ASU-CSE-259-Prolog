drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).



%-------------------------------------------------------------------------------------------------
% draw the A
drawAWithoutSpaces(Symbol, TextWidth, 0).
drawAWithoutSpaces(Symbol, TextWidth, N) :- N > 0, drawSymbol(Symbol, TextWidth), nl, N1 is N - 1, drawAWithoutSpaces(Symbol, TextWidth, N1).


drawAWithSpaces(Symbol, FontSize, 0).
drawAWithSpaces(Symbol, FontSize, N) :- N > 0, drawSymbol(Symbol, FontSize), drawSymbol(' ', FontSize), drawSymbol(Symbol, FontSize), nl, N1 is N - 1, drawAWithSpaces(Symbol, FontSize, N1).


drawA(Symbol, FontSize) :-
  drawAWithoutSpaces(Symbol, FontSize * 3, FontSize),
  drawAWithSpaces(Symbol, FontSize, FontSize),
  drawAWithoutSpaces(Symbol, FontSize * 3, FontSize),
  drawAWithSpaces(Symbol, FontSize, FontSize),
  drawAWithSpaces(Symbol, FontSize, FontSize).
%-------------------------------------------------------------------------------------------------



%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------



%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------



main(Symbol, FontSize) :- drawA(Symbol, FontSize).
