function [r,rn] = newton_method(fun,dfun,x0,tol,nmax)

xn=x0; rn(1)=x0; 


   n=0; 
    while abs(fun(xn))>tol && n < nmax
        
        xn = xn - fun(xn)/dfun(xn); 
        n=n+1; 
        rn(n)=xn; 
    end
    
    r=xn;

end