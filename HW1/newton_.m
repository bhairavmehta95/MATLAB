% Newton method example (lecture 3) 
fun = @(x) x^2; 
dfun = @(x) 2*x; 
x0=1.5; 

% apply Newton method (in separate function file) 
tol=eps; nmax = 10;  
[r,rn] = newton_method(fun,dfun,x0,tol,nmax);

% plot error
plot(log10(abs(r-rn(1:end-1))),'-o')
