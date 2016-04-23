% Secant method example (lecture 3) 
fun = @(x) x^3 - 3;  
x0=1; x1=2; 

% apply Secant method (in separate function file) 
tol=1e-14; nmax = 10;  
[r,rn] = secant_method(fun,x0,x1,tol,nmax);

% plot error
plot(log10(abs(r-rn(1:end-1))),'-o')