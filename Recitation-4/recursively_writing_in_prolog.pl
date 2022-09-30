drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), M is N - 1, drawSymbol(Symbol, M). 

drawSymbolV2(Symbol, 0).
drawSymbolV2(Symbol, N) :- N > 0, write(Symbol), N > 0, drawSymbolV2(Symbol, N - 1). 