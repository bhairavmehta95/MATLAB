function g = lagrange_interp(f,n,y,xi)
%{
Lagrange interpolation of the function f on n+1 equispaced points 
on the interval [-1,1]. g is the corresponding interpolant, evaluated at
point(s) given in the array y. 
%}

m = length(y); 

if nargin<4
    % Set of n+1 equispaced points
    xi = linspace(-1,1,n+1);
end

% Evaluate function at equispaced pts
fi = f(xi).'; 

% Creates a matrix of size n+1 x length(y). Each row is the corresponding
% Lagrange polynomial for that xi. 
L = lagrangepoly(xi,y); 

% The interpolant g is now just sum ( f(x_i) * l_i (y) )
g = sum(repmat(fi,1,m).*L); 

end