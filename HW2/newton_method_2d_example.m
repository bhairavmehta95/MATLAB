% System of equations solved by Newton's Method 
% Bhairav Mehta, MATH371 HW2 W16

% fn handles, take a 2-vector x as input
fun = @(x) [(x(1)-1).^2 + x(2).^2 - 4; x(1).*x(2) - 1];
%compute jacobian analytically
Jfun = @(x) [2*(x(1)-1) 2*x(2) ; x(2) x(1)];

% try newton's starting from 3,0 with 5 steps
x0 = [3 0]'; tol=1e-10; nmax=45; verb=1; 
[r,rn] = newton_method_nd(fun,Jfun,x0,tol,nmax,verb); 

% First, we plot the two curves that represent fun(x,y) = 0. We observe
% there are two solutions: [1 1] and [2 0]. 
th = [0:2*pi/100:2*pi]'; %since we k  now they are circles, we use an angle theta 
%to plot them. 
C1 = [cos(th)+1 sin(th)];
C2 = [cos(th)+2 sin(th)+1]; 
figure; 
plot(C1(:,1),C1(:,2),'k'); 
hold on; 
plot(C2(:,1),C2(:,2),'k');
axis equal; axis tight; %fixes the axes

% % Try Newton's method
% x0 = [-0.5 0.5]'; tol=1e-10; nmax=15; verb=1; 
% [r,rn] = newton_method_nd(fun,Jfun,x0,tol,nmax,verb); 

% This initial guess converges to [1 1]. We measure the error, and do a
% log-log-plot to check quadratic convergence. 
en = zeros(size(rn,2),1); 
for i=1:size(rn,2)
    en(i) = sqrt((1-rn(1,i))^2+(1-rn(2,i))^2); 
end

figure; 
plot(log10(en),'-o'); 

pause; 

%{
[r,rn] = broyden_method_nd(fun,Jfun(x0),x0,tol,nmax,verb);
for i=1:size(rn,2)
    en(i) = sqrt((1-rn(1,i))^2+(1-rn(2,i))^2); 
end

figure; 
plot(log10(en),'-o'); 

pause; 
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Secondly, let us see what initial conditions converge to which of the two
% answers.
clear r rn; 
[x,y] = meshgrid((0:0.1:3),(-0.95:0.1:3));
X = [x(:) y(:)];
niter=zeros(length(X),1); Tbroyden=niter; 
for i=1:length(X)
    x0 = X(i,:)'; 
    tic; 
    [r(:,i),rn{i}] = newton_method_nd(fun,Jfun,x0,tol,nmax,0);
    Tnewton(i) = toc; 
    niter(i)=length(rn{i}); 
end

for i=1:length(X)
en1(i) = norm(1-r(:,i));
en2(i) = norm([2 0]'-r(:,i));
end

figure; 
plot(C1(:,1),C1(:,2),'k'); 
hold on; 
plot(C2(:,1),C2(:,2),'k');
axis equal; axis tight; %fixes the axes
plot(X(en1<1e-8,1),X(en1<1e-8,2),'.')
plot(X(en2<1e-8,1),X(en2<1e-8,2),'.r')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause; 
%plot number of iterations for different starting points
figure; 
surf(x,y,reshape(niter,size(x))); 

pause; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example in many variables
N = 2000; 
U = rand(N,N);
[Q,R] = qr(U); 
M = Q*Q'; 

fun2 = @(x) x.^3 + M*x+3; 
Jfun2 = @(x) diag(3*x.^2) + M; 
x0 = 2*ones(N,1); 
tol=1e-10; nmax=20; verb=0; 

profile on; 
tic; 
[r,rn] = newton_method_nd(fun2,Jfun2,x0,tol,nmax,verb); 
TnewtonN=toc;
pf = profile('info'); profile off;  

en2 = zeros(size(rn,2)-1,1); 
for i=1:size(rn,2)-1
    dn = r-rn(:,i);
    en2(i) = sqrt(dn'*dn); 
end

figure; 
plot(log10(en2),'-ok');