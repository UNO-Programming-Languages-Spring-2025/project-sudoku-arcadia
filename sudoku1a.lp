% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define numbers and positions
num(1..4).
pos(1..4).

% Each cell (X, Y) contains exactly one number
1 { sudoku(X, Y, N) : num(N) } 1 :- pos(X), pos(Y).

% Each row contains all numbers exactly once
:- pos(Y), num(N), #count { X : sudoku(X, Y, N) } != 1.

% Each column contains all numbers exactly once
:- pos(X), num(N), #count { Y : sudoku(X, Y, N) } != 1.
#show sudoku/3.
