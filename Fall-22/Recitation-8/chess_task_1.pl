drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


main :- 
  initBoard(BoardStates),
  drawBoard(BoardStates, 8, 8).


drawBoard(BoardStates, 0, Col) :- drawSymbol(' ', 1), drawBorderLine(Col), drawPair.
drawBoard(BoardStates, Row, Col) :-
  Row > 0,
  drawSymbol(' ', 1),
  drawBorderLine(Col),
  drawSymbol(Row, 1),
  drawContentCell(BoardStates, Row, Col),
  NewRow is Row - 1,
  drawBoard(BoardStates, NewRow, Col).


drawBorderLine(0) :- drawSymbol('+', 1), nl.
drawBorderLine(Col) :-
  Col > 0,
  drawSymbol('+', 1), drawSymbol('-', 4),
  NewCol is Col - 1,
  drawBorderLine(NewCol).


drawContentCell(BoardStates, Row, 0) :- drawSymbol('|', 1), nl.
drawContentCell(BoardStates, Row, Col) :-
  Col > 0,
  drawSymbol('|', 1), drawCell(BoardStates, Row, Col),
  NewCol is Col - 1,
  drawContentCell(BoardStates, Row, NewCol).


% finds whether the current cell has any white or black piece in it
drawCell(BoardStates, Row, Col) :-
  pair(Name, Col),
  myMember(piece(Name-Row, Color, Piece), BoardStates),
  drawSymbol(' ', 1),
  (
    (Color == black, drawSymbol('*', 1));
    (Color == white, drawSymbol(' ', 1))
  ),
  pair(Piece, PieceAbbreviation),
  drawSymbol(PieceAbbreviation, 1),
  drawSymbol(' ', 1).

% deals with white space
drawCell(BoardStates, Row, Col) :-
  pair(Name, Col),
  \+ (myMember(piece(Name-Row, Color, Piece), BoardStates)),
  drawSymbol(' ', 4).

  
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
pair(rook, r).
pair(bishop, b).
pair(king, k).
pair(pawn, p).
pair(queen, q).
pair(knight, n).


myMember(Piece, [Piece | _]).
myMember(Piece, [_ | T]) :- myMember(Piece, T).


initBoard([
  piece(a-8, black, rook  ), piece(b-8, black, night ),
	piece(c-8, black, bishop), piece(d-8, black, queen ),
	piece(e-8, black, king  ), piece(f-8, black, bishop),
	piece(g-8, black, night ), piece(h-8, black, rook  ),
	piece(a-7, black, pawn  ), piece(b-7, black, pawn  ),
	piece(c-7, black, pawn  ), piece(d-7, black, pawn  ),
	piece(e-7, black, pawn  ), piece(f-7, black, pawn  ),
	piece(g-7, black, pawn  ), piece(h-7, black, pawn  ),
	piece(a-1, white, rook  ), piece(b-1, white, night ),
	piece(c-1, white, bishop), piece(d-1, white, queen ),
	piece(e-1, white, king  ), piece(f-1, white, bishop),
	piece(g-1, white, night ), piece(h-1, white, rook  ),
	piece(a-2, white, pawn  ), piece(b-2, white, pawn  ),
	piece(c-2, white, pawn  ), piece(d-2, white, pawn  ),
	piece(e-2, white, pawn  ), piece(f-2, white, pawn  ),
	piece(g-2, white, pawn  ), piece(h-2, white, pawn  )
]).