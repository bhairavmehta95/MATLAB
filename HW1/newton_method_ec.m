function [r,rn] = newton_method_ec(fun,dfun,x0,tol,nmax)

xn=x0; rn(1)=x0; 

if abs(dfun(xn))<tol
    fprintf('\n derivative at initial guess is near 0, try different pt \n'); 
else
   n=0; 
    fprintf('\n|--n--|----xn----|---|f(xn)|---|----AbsError---|')
    while abs(fun(xn))>tol && n<=nmax
        fprintf('\n|--%d--|%1.15f|%1.15f|%1.15f|',n,xn,(fun(xn)), abs(xn - 0));       
        xn = xn - 2*fun(xn)/dfun(xn); 
        n=n+1; 
        rn(n)=xn; 
    end
    
    r=xn;
    
    if abs(fun(xn))>tol
        fprintf('\n Newton method failed to converge, n=%d, res=%e\n',nmax,abs(fun(xn))); 
    end
end

end