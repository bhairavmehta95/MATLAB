% % HW2, 3b and Extra Credit 
% % Bhairav Mehta, MATH371 HW2 W16

%creates the matrix
A = [2 3 -1; 4 4 -3; -2 3 -1];

%assigns the lower and upper matrices based on matlabs lu fn
[L, U, p] = lu(A, 'vector');

%original b
b = [5 3 1]';

%permuted b
bp = b(p);

%solving with forward and backwards substituion.
y = L\bp;
x = U\y;

%the error and resuidual are both equal to 0 in this example.
%the example below is for extra credit, and we will be able to see 
%when the error and residual are NOT equal to zero.

clear all;

%%%%%%%%%%%%%%%%%%%%%% Extra Credit %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%creates the matrix
A = [2.5 3 -1; 4 4 -3; -2 3 -1];

%assigns the lower and upper matrices based on matlabs lu fn
[L, U, p] = lu(A, 'vector');

%original b
b = [5 3 1]';

%permuted b
bp = b(p);

%solving with forward and backwards substituion.
y = L\bp;
x = U\y;

% 
% Explanation of why the error and residial are not
% equal to zero:
% 
% After a row reduction step, a value started to approach zero in the matrix
% introducing error into the system.
% As the calculations containued, the error snowballed, which is why 
% both the error and residual are non zero.
% 
