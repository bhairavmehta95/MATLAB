function [r,rn] = secant_method(fun,x0,x1,tol,nmax)

xnm=x0; xn=x1; rn(1)=x1; 
n=0; 
fprintf('\n|--n--|----xn----|---|f(xn)|---|---AbsError---|')
while abs(fun(xn))>tol && n<=nmax
    fprintf('\n|--%d--|%1.15f|%1.15f|%1.15f|',n,xn,abs(fun(xn)), abs(xn - 1.442496));  
    pause; 
    
    dsec = (fun(xn)-fun(xnm))/(xn-xnm); 
    xnm=xn; 
    xn = xn - fun(xn)/dsec; 
    n=n+1; 
    rn(n)=xn; 
end
    
r=xn;
    
if abs(fun(xn))>tol
    fprintf('\n Secant method failed to converge, n=%d, res=%e\n',nmax,abs(fun(xn))); 
end

end