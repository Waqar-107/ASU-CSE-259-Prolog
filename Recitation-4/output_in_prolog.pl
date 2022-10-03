drawSymbolUsingWrite :- write('***'), nl, write('this was printed using write'), nl, write('***').

drawSymbolUsingPrint :- print('***'), nl, print('this was printed using print'), nl, print('***').

useTabAndPut :- put(80), tab(4), put_char('r'), write('olog').