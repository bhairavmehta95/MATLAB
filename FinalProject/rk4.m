function [x,tk] = rk4(v,x0,dt,Nt)
% Solves the first order differential equation 
%               dx/dt = v(x,t) ;  x(0) = x0 
%using the Runge-Kutta method of 4th order. x can be scalar or vector, of size equal
%to that of x0. v = @(x,t) should be an appropriate function handle.

% Set initial conditions
x0 = x0(:); 
dim = size(x0,1); 
x = zeros(dim,Nt+1); 
tk = zeros(1,Nt+1); 
x(:,1) = x0; 
tk(1) = 0; 

halfdt = dt / 2;
dt6 = dt/6;

for k = 1 : Nt
    tk(k+1) = tk(k) + dt;
    s1 = v(x(:,k),tk(k));
    s2 = v(x(:,k) + halfdt * s1,tk(k)+halfdt);
    s3 = v(x(:,k) + halfdt * s2,tk(k)+halfdt);
    s4 = v(x(:,k) + dt * s3,tk(k+1));
    x(:,k+1) = x(:,k) + (s1 + 2*s2 + 2*s3 + s4) * dt6;
end;