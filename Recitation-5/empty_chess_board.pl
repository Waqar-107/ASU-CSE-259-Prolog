drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


drawBorderLine(0) :- drawSymbol('+', 1), nl.
drawBorderLine(Col) :-
  Col > 0,
  drawSymbol('+', 1), drawSymbol('-', 4),
  NewCol is Col - 1,
  drawBorderLine(NewCol).


drawContentCell(Row, 0) :- drawSymbol('|', 1), nl.
drawContentCell(Row, Col) :-
  Col > 0,
  drawSymbol('|', 1), drawSymbol(' ', 4),
  NewCol is Col - 1,
  drawContentCell(Row, NewCol).


drawPair :-
  drawSymbol(' ', 4), drawSymbol('a', 1), drawSymbol(' ', 4), drawSymbol('b', 1),
  drawSymbol(' ', 4), drawSymbol('c', 1), drawSymbol(' ', 4), drawSymbol('d', 1),
  drawSymbol(' ', 4), drawSymbol('e', 1), drawSymbol(' ', 4), drawSymbol('f', 1),
  drawSymbol(' ', 4), drawSymbol('g', 1), drawSymbol(' ', 4), drawSymbol('h', 1).


drawBoard(0, Col) :- drawSymbol(' ', 1), drawBorderLine(Col), drawPair.
drawBoard(Row, Col) :-
  Row > 0,
  drawSymbol(' ', 1),
  drawBorderLine(Col),
  drawSymbol(Row, 1),
  drawContentCell(Row, Col),
  NewRow is Row - 1,
  drawBoard(NewRow, Col).


  
main :- drawBoard(8, 8).