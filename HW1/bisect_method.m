function [r,rn] = bisect_method(fun,a,b,tol,nmax)

an = a; bn = b; n=0; xn = (an+bn)/2; rn(n+1)=xn;  
fprintf('\n Bisection method with nmax=%d and tol=%e\n',nmax,tol); 

if fun(a)*fun(b)>=0
    fprintf('\n Interval is inadequate, f(a)*f(b)>=0. Try again \n')
    display(fun(a)*fun(b)); 
    r=[]; rn=[]; 
else

   fprintf('\n|--n--|----xn----|-f(xn)--|---absError---|')
    
while n<=nmax
   fprintf('\n|--%d--|%1.15f|%1.15f|%1.15f|%1.15f|%1.15f|',n,xn,fun(xn),abs(1.44222-xn));  
   pause; 
   
   % If the estimate is approximately a root, get out of while loop
   if abs(fun(xn))<tol 
       break; 
   end
   
   % If fun(an)*fun(xn)<0, pick left interval, update bn
   if fun(an)*fun(xn)<0
      bn=xn;     
   else
      %else, pick right interval, update an
      an=xn;  
   end
   
   % update midpoint xn, increase n. 
   n=n+1; 
   xn = (an+bn)/2; 
   rn(n+1)=xn;
end

% Set root estimate to xn. 
r=xn; 

end

end