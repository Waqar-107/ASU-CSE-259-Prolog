/*
 * For the height, we have multiplied with 5
 * Let's consider a variable called HeightSegmentNumber whose possible values are 1, 2, 3, 4, and 5
 */
drawA(FontSize, HeightSegmentNumber) :-
  (HeightSegmentNumber =:= 1; HeightSegmentNumber =:= 3),
  write(HeightSegmentNumber),
  write(' no space\n').

drawA(FontSize, HeightSegmentNumber) :-
  (HeightSegmentNumber =:= 2; HeightSegmentNumber >= 4).
  write(HeightSegmentNumber),
  write(' with space').

/*
drawARecursive(FontSize, HeightSegmentNumber) :-
  HeightSegmentNumber < 6,
*/

even(N) :- (N mod 2) =:= 0.
odd(N) :- (N mod 2) =:= 1.