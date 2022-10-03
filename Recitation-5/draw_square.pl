drawRectangle(Height, Width) :-
  integer(Height),
  integer(Width),
  drawHorizontalLine('-', Width),
  drawVerticalSpace('|', Height, Width - 2),
  drawHorizontalLine('-', Width).

drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).

drawHorizontalLine(Symbol, 0) :- nl.
drawHorizontalLine(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawHorizontalLine(Symbol, N1).

drawVerticalSpace(Symbol, 0, Width).
drawVerticalSpace(Symbol, Height, Width) :- 
  Height > 0, write(Symbol), drawSymbol(' ', Width),
  write(Symbol), nl, Height1 is Height - 1, drawVerticalSpace(Symbol, Height1, Width).