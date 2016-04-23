
%Here is my function 
fun = @(x) [(x(1)-1).^2 + x(2).^2-4 ; (x(1).*x(2)-1)];
%Here is my Jacobian function
Jfun = @(x) [2*(x(1)-1),  2*x(2) ; x(2), x(1)];

%Here I test the a part of question 2
x0 = [3 0]'; tol=-1e-10; nmax=5; verb=1;
[r,rn] = newton_method_nd(fun,Jfun,x0,tol,nmax,verb);
%This will iterate less than five times if the tolerance is to the
%negative tenth so I decreased the tolerance so that five steps can
%iterate. The output will show up in the command Window

% I test part b of question 2. I keep the same tolerance as above, however
% what happens is that the jacobian becomes non invertible thus not
% allowing for matrix multiplication and throws a wrench in the newton
% method function making it stop iterate. 
x0 = [1 0]'; tol=-1e-10; nmax=5; verb=1;
[r,rn] = newton_method_nd(fun,Jfun,x0,tol,nmax,verb);


%We start to graph the values of a mesh and where those points on the mesh
%if we started at those points would result in. Either we would get the
%solution, another solution, or no solution. 
clear r rn; 
[xgrid,ygrid] = meshgrid((-1.95:0.25:3.95),(-1.95:.25:3.95));
X = [xgrid(:) ygrid(:)]';
tol = 10^-10;
nmax = 20;
verb = 0;
k = (1:576);
n = 0;
%We test through each iteration and go through and graph it. 
for i=1:length(X)
   xo = X(:,i);
   [r, rn] = newton_method_nd(fun,Jfun,xo,tol,nmax,verb);
   n = n + 1;
   if r(1)>2.914 && r(1)<2.9715 && r(2)<.337 && r(2)>.335;
       k(i) = 2;
   elseif n > nmax;
       k(i) = 1;
   else 
       k(i) = 3;
   end
end

figure
hold on
for i = 1:length(k)
    if k(i) == 1 
        plot(xgrid(i),ygrid(i),'.r')
    elseif k(i) ==2
        plot(xgrid(i), ygrid(i),'.g')
    else
        plot(xgrid(i), ygrid(i),'.b')
    end
   
end

