drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


main :- drawBoard(8, 8).


drawBoard(0, Col) :- drawSymbol(' ', 1), drawBorderLine(Col), drawPair.
drawBoard(Row, Col) :-
  Row > 0,
  drawSymbol(' ', 1),
  drawBorderLine(Col),
  drawSymbol(Row, 1),
  drawContentCell(Row, Col),
  NewRow is Row - 1,
  drawBoard(NewRow, Col).


drawBorderLine(0) :- drawSymbol('+', 1), nl.
drawBorderLine(Col) :-
  Col > 0,
  drawSymbol('+', 1), drawSymbol('-', 4),
  NewCol is Col - 1,
  drawBorderLine(NewCol).


drawContentCell(Row, 0) :- drawSymbol('|', 1), nl.
drawContentCell(Row, Col) :-
  Col > 0,
  drawSymbol('|', 1), drawCell(Row, Col),
  NewCol is Col - 1,
  drawContentCell(Row, NewCol).


drawCell(Row, Col) :-
  pair(Fill, Col),
  drawSymbol(' ', 1),
  drawSymbol(Fill, 1),
  drawSymbol(Row, 1),
  drawSymbol(' ', 1).


drawPair :-
  drawSymbol(' ', 4), drawSymbol('a', 1), drawSymbol(' ', 4), drawSymbol('b', 1),
  drawSymbol(' ', 4), drawSymbol('c', 1), drawSymbol(' ', 4), drawSymbol('d', 1),
  drawSymbol(' ', 4), drawSymbol('e', 1), drawSymbol(' ', 4), drawSymbol('f', 1),
  drawSymbol(' ', 4), drawSymbol('g', 1), drawSymbol(' ', 4), drawSymbol('h', 1).


pair(a, 8).
pair(b, 7).
pair(c, 6).
pair(d, 5).
pair(e, 4).
pair(f, 3).
pair(g, 2).
pair(h, 1).