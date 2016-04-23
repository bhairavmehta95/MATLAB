% Bisection method example (lectures 2-3) 
fun = @(x) x^3 - 3; 

% We find an interval [a,b] to use (check graphically)
a=1; b=2; 

% Bisection method (using matlab function)
tol=1e-8; nmax = ceil(log2(1/tol));  
[r,rn] = bisect_method(fun,a,b,tol,nmax);

% approximate error
e = abs(r-rn(1:end-1)); 
% length of interval
ln = (1/2).^(0:length(e)-1);

figure; 
plot(-log2(ln),log2(e),'-o')