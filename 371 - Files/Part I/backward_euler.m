function [x,tk] = backward_euler(v,dv,x0,dt,Nt,tol)
% Solves the first order differential equation 
%               dx/dt = v(x,t) ;  x(0) = x0 
%using the backward-euler method. x can be scalar or vector, of size equal
%to that of x0. v = @(x,t) and dv =@(x,t) should be appropriate function
%handles for the function v and its derivative / Jacobian. 

% Set initial conditions
x0 = x0(:); 
dim = size(x0,1); 
x = zeros(dim,Nt+1); 
tk = zeros(1,Nt+1); 
x(:,1) = x0; 
tk(1) = 0; 
nmax=10; 

for k=1:Nt
    tk(k+1) = tk(k)+dt; 
    
    % Backward euler rule: x(t_k+dt) = x(t_k) + dt*v(x(t_k+dt))
    
    % Solve for x(tk+dt) using Newton method for 
    % F(y) = dt*v(y,t_k) - y + x(t_k) = 0
    fun = @(y) dt*v(y,tk(k))-y + x(:,k); 
    x0 = x(:,k); 
    if dim==1
        dfun = @(y) dt*dv(y,tk(k))-1;
        x(:,k+1) = newton_method(fun,dfun,x0,tol,nmax);
    else 
        dfun = @(y) dt*dv(y,tk(k))-eye(dim);
        x(:,k+1) = newton_method_nd(fun,dfun,x0,tol,nmax); 
    end
end

end