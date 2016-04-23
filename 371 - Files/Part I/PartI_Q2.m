% Math 371 Final Project
% Stefano DeBellis (stefdeb)
% Wyatt Kowall (wskowall)
% Nirmal Patel (nnvpatel)
% % Bhairav Mehta (bhairavm)

close all;
format long;

% %%%%% Part I: ODE Solvers %%%%%


% How to use this file:
% This file is separated into sections with both comments and matlab's own %%
% To run a specific section, click anywhere in that section, and click run section.
% Any corresponding output will show up in the command windows, and any graphs will 
% show up whenever the function is done running.

%%

v = @(x,t) -10^6 * x;
solution = @(x) exp(-x*10^6);

%%%%%%%%%%%%%%%%%%%% FORWARD EULER %%%%%%%%%%%%%%%%%%%%%%%%%%
x0 = 1;
num_pts = 2;
err = 1;
n = 1;
while err > 5e-4
    [x, tk1] = forward_euler(v, x0, 1/num_pts, num_pts);
    [x_small, tk2] = forward_euler(v, x0, 1/(num_pts*10), 10*num_pts);

    solution_1 = solution(tk1);
    solution_2 = solution(tk2);
    err = max(abs(x - solution_1));
    err_sm = max(abs(x_small - solution_2));
    str = sprintf('FWE: Num_pts: %d, Error Normal: %d, Error small: %d\n',num_pts, err, err_sm); disp(str)
    num_pts = num_pts *2;
    
    fwe_output(n, 1) = num_pts;
    fwe_output(n, 2) = err;
    fwe_output(n, 3) = num_pts*10;
    fwe_output(n, 4) = err_sm;
    
    n = n + 1;
end

 num_pts = num_pts/2;
 
 k = log10(err) - log10(err_sm);
 str = sprintf('Order of convergence for FORWARD EULER METHOD IS: %d', k); disp(str)
 
 %%%%%%%%%%%%%%%%%%%% BACKWARD EULER %%%%%%%%%%%%%%%%%%%%%%%%%%
%%
v = @(x,t) -10^6 * x;
solution = @(x) exp(-x*10^6);
dv = @(x, t) (-10^6)*exp(-x*10^6);
x0 = 1;
num_pts = 2;
err = 1;
tol = eps;
n = 1;

while err > 5e-3
    [x, tk1] = backward_euler(v, dv, x0, 1e-4/num_pts, num_pts, tol);
    [x_small, tk2] = backward_euler(v, dv, x0, 1e-4/(10*num_pts), 10*num_pts, tol);

    solution_1 = solution(tk1);
    solution_2 = solution(tk2);
    err = max(abs(x - solution_1));
    err_sm = max(abs(x_small - solution_2));
    str = sprintf('BWE: Num_pts: %d, Error Normal: %d, Error small: %d\n',num_pts, err, err_sm); disp(str)
    num_pts = num_pts *2;
    
    bwe_output(n, 1) = num_pts;
    bwe_output(n, 2) = err;
    bwe_output(n, 3) = num_pts*10;
    bwe_output(n, 4) = err_sm;
    
    n = n + 1;
end

 num_pts = num_pts/2;
 
 k = log10(err) - log10(err_sm);
 str = sprintf('Order of convergence for BACKWARD EULER METHOD IS: %d', k); disp(str)
 
 %%%%%%%%%%%%%%%%%%%% RK4 %%%%%%%%%%%%%%%%%%%%%%%%%%
%%

% Requires a lot of iterations before answers start making sense
% Change tolerance if you want faster answers

v = @(x,t) -10^6 * x;
solution = @(x) exp(-x*10^6);
x0 = 1;
num_pts = 2;
err = 1;
n = 1;
while err > 5e-4
    [x, tk1] = rk4(v, x0, 1/num_pts, num_pts);
    [x_small, tk2] = rk4(v, x0, 1/(num_pts*10), 10*num_pts);

    solution_1 = solution(tk1);
    solution_2 = solution(tk2);
    err = max(abs(x - solution_1));
    err_sm = max(abs(x_small - solution_2));
    str = sprintf('RK4: Num_pts: %d, Error Normal: %d, Error small: %d\n',num_pts, err, err_sm); disp(str)
    num_pts = num_pts *2;
    
    rk4_output(n, 1) = num_pts;
    rk4_output(n, 2) = err;
    rk4_output(n, 3) = num_pts*10;
    rk5_output(n, 4) = err_sm;
    
    n = n + 1;
end

 num_pts = num_pts/2;
 
 k = log10(err) - log10(err_sm);
 str = sprintf('Order of convergence for RUNGE KUTTA 4 METHOD IS: %d', k); disp(str)

