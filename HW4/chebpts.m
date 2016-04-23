function c = chebpts(n)
% Chebyshev points on [-1,1]

theta = linspace(0,pi,n+1);
c = -cos(theta); 