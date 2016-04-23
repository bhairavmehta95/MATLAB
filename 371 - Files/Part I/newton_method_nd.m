function [r,rn] = newton_method_nd(fun,Jfun,x0,tol,nmax,verb)
if nargin<6
    verb=0; 
end

xn=x0; rn(:,1)=x0; Fn = fun(xn); 

n=0; 
if verb
fprintf('\n|--n--|----xn----|---|f(xn)|---|')
end
while norm(Fn)>tol && n<=nmax
    Jn=Jfun(xn);  
    
    if verb
    fprintf('\n|--%d--|%1.7f|%1.7f|',n,norm(xn),norm(Fn));  
    pause; 
    end
    
    %if condest(Jn)>1e8
    %   break;  
    %end
    
    xn = xn - Jn\Fn; 
    n=n+1; 
    rn(:,n)=xn;
    Fn = fun(xn); 
end
    
r=xn;
    
if norm(Fn)>tol
   fprintf('\n Newton method failed to converge, n=%d, res=%e\n',nmax,norm(Fn)); 
end

end