% Newton method example (lecture 3) 
fun = @(x) x^2; 
dfun = @(x) 2*x; 
x0=10; 

% apply Newton method (in separate function file) 
tol=1e-14; nmax = 10;  
[r,rn] = newton_method_ec(fun,dfun,x0,tol,nmax);

% plot error
plot(log10(abs(r-rn(1:end-1))),'-o')
