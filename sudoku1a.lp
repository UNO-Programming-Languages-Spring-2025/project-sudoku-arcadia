% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
num(1..4).
pos(1..4).

1 {sudoku(X,Y,N) : num(N) } 1 :- pos(X), pos(Y).
:- pos(Y), num(N), #count {X : sudoku(X,Y,N)} != 1.
:- pos(X), num(N), #count {Y : sudoku(X,Y,N)} != 1.

subgrid(X,Y,S) :- pos(X), pos(Y), S = 1 +(((X-1)/2)*2+(Y-1)/2).

:- num(N), subgrid(X1,Y1,S), subgrid(X2,Y2,S), X1 != X2, Y1 != Y2,sudoku(X1,Y1,N), sudoku(X2,Y2,N).
#show sudoku/3.
