drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).

drawHorizontalLine(Symbol, 0) :- nl.
drawHorizontalLine(Symbol, N) :- drawSymbol(Symbol, N).

drawVerticalLines(Symbol, 0, Width).
drawVerticalLines(Symbol, Height, Width) :- 
  Height > 0,
  write(Symbol),
  drawSymbol(' ', Width - 2),
  write(Symbol),
  nl,
  Height1 is Height - 1,
  drawVerticalLines(Symbol, Height1, Width).

drawRectangle(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize),
  Width is (LeftRightMargin * 2 + SpaceBetweenCharacters * 2 + FontSize * 3 * 3 + 2),
  Height is (BottomTopMargin * 2 + FontSize * 5),
  drawHorizontalLine('-', Width),
  nl,
  drawVerticalLines('|', Height, Width),
  drawHorizontalLine('-', Width).
