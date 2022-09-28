drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


drawHorizontalLine(Width) :- drawSymbol('-', Width).


drawVerticalLinesWithSpace(0, Width).
drawVerticalLinesWithSpace(Height, Width) :-
  Height > 0, write('|'), drawSymbol(' ', Width), write('|'), nl, H1 is Height - 1, drawVerticalLinesWithSpace(H1, Width).


a(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :- 
  TextWidth is FontSize * 3,
  TextHeight is FontSize * 5,
  HorizontalLineLength is TextWidth + LeftRightMargin * 2 + 2,
  drawHorizontalLine(HorizontalLineLength), nl,
  drawVerticalLinesWithSpace(BottomTopMargin, HorizontalLineLength - 2),
  draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, 0),
  drawVerticalLinesWithSpace(BottomTopMargin, HorizontalLineLength - 2),
  drawHorizontalLine(HorizontalLineLength).


draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, CurrentLine) :-
  CurrentLine >= TextHeight.

draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, CurrentLine) :-
  CurrentLine < TextHeight,
  ColumnNumber is 0,
  write('|'),
  drawSymbol(' ', LeftRightMargin),
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  drawSymbol(' ', LeftRightMargin),
  NextLine is CurrentLine + 1,
  write('|'),
  nl,
  draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, NextLine).


%------------------------------------------------
% draw A
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* 
 * Covers the left-most and the right-most columns that only have stars 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* 
 * Covers the middle segment
 * Will have either stars or spaces 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < TextHeight)
  ),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).