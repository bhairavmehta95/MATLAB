function [x,tk] = forward_euler(v,x0,dt,Nt)
% Solves the first order differential equation 
%               dx/dt = v(x,t) ;  x(0) = x0 
%using the forward-euler method. x can be scalar or vector, of size equal
%to that of x0. v = @(x,t) should be an appropriate function handle. 

% Set initial conditions
x0 = x0(:); 
dim = size(x0,1); 
x = zeros(dim,Nt+1); 
tk = zeros(1,Nt+1); 
x(:,1) = x0; 
tk(1) = 0; 

for k=1:Nt
    tk(k+1) = tk(k)+dt; 
    % Forward euler rule: x(t_k+dt) = x(t_k) + dt*v(x(t_k))
    x(:,k+1) = x(:,k) + dt*v(x(:,k),tk(k)); 
end

end