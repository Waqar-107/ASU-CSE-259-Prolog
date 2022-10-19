drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).

main :- drawBoard(8).

drawBoard(0) :- 
  ColumnNumber is 8,
  drawContentLine(ColumnNumber).
  
drawBoard(RowNumber) :-
  RowNumber > 0,
  ColumnNumber is 8,
  drawContentLine(ColumnNumber),
  drawContentCell(ColumnNumber),
  NewRowNumber is RowNumber - 1,
  drawBoard(NewRowNumber).  

drawContentLine(0) :- write('+'), nl.
drawContentLine(ColumnNumber) :-
  ColumnNumber > 0,
  write('+'), drawSymbol('-', 4),
  NewColumnNumber is ColumnNumber - 1,
  drawContentLine(NewColumnNumber).

drawContentCell(0) :- write('|'), nl.
drawContentCell(ColumnNumber) :-
  ColumnNumber > 0,
  write('|'), drawSymbol(' ', 4),
  NewColumnNumber is ColumnNumber - 1,
  drawContentCell(NewColumnNumber).
