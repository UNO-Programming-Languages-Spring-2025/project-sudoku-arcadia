% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define numbers and positions
num(1..9).
pos(1..9).
sudoku(X,Y,N) :- initial(X,Y,N).

% Each cell (X, Y) contains exactly one number
1 { sudoku(X, Y, N) : num(N) } 1 :- pos(X), pos(Y).

% Each row contains all numbers exactly once
:- pos(Y), num(N), #count { X : sudoku(X, Y, N) } != 1.

% Each column contains all numbers exactly once
:- pos(X), num(N), #count { Y : sudoku(X, Y, N) } != 1.

subgrid(X,Y,G) :- pos(X), pos(Y), G = 1 +(((X-1)/3)*3+(Y-1)/3).   

:- num(N), subgrid(X1,Y1,G), subgrid(X2,Y2,G), X1 != X2, Y1 != Y2, sudoku(X1,Y1,N), sudoku(X2,Y2,N).

#show sudoku/3.
