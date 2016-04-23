% Homework 2 #2a

% |--n--|----xn----|---yn---|----|f(xn)|----|---|g(xn)|---|
% |--0--|3.0000000|0.0000000||0.0000000|-1.0000000|
% |--1--|3.0000000|0.3333333||0.1111111|0.0000000|
% |--2--|2.9716981|0.3364780||0.0008109|-0.0000890|
% |--3--|2.9714832|0.3365323||0.0000000|-0.0000000|>> 

% 2b
% No it does not converge. It says the matrix is singular to working precision
% which means that after the first step, the Jacobian matrix is updated and 
% contains a row of all 0s or a column of all 0s, which makes the matrix rank deficient.
% This happens when the determinant is = 0, which renders the matrix uninvertible.

