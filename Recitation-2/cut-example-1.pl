% facts
red(apple).
red(lexus).
red(honda).
blue(monkey).

car(honda).
car(lexus).
bike(monkey).

fun(X) :- red(X), car(X).
fun(X) :- blue(X), bike(X).