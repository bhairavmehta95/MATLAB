Math 371 Final Project
Stefano DeBellis (stefdeb)
Wyatt Kowall (wskowall)
Nirmal Patel (nnvpatel)
% Bhairav Mehta (bhairavm)

close all;
format long;

%%%%% Part I: ODE Solvers %%%%%

% % % How to use this file:
% % % This file is separated into sections with both comments and matlab's own %%
% % % To run a specific section, click anywhere in that section, and click run section.
% % % Any corresponding output will show up in the command windows, and any graphs will 
% % % show up whenever the function is done running.

%%%%%%%%%%%%%%%%%%%%%% QUESTION 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%  Forward Euler %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
v = @(x,t) [x(2); -10^4*x(1)];
solution = @(x) [cos(100*x); 0*x];

x0 = [1; 0];
num_pts = 1000;
err = 1;
n = 0;



[x_1, tk] = forward_euler(v, x0, 1/num_pts, num_pts);
str = sprintf('Computed x_1'); disp(str)
[x_2, tk] = forward_euler(v, x0, 1/(num_pts*10), num_pts*10);
str = sprintf('Computed x_2'); disp(str)
[x_3, tk] = forward_euler(v, x0, 1/(num_pts*100), num_pts*100);
str = sprintf('Computed x_3'); disp(str)

    

    for i = 1:num_pts
       error_1(i) = x_1(1, i);
       error_2(i) = x_2(1, i*10-9);
       error_3(i) = x_3(1, i*100-99);
    end
    
    err_1_2 = abs(error_1 - error_2);
    err_2_3 = abs(error_2 - error_3);
    
    k = log10(err_1_2) - log10(err_2_3);

    plot(k);



close all;
figure;
plot(tk(1,1:err_idx), x(1,1:err_idx), 'r', tk(1,1:err_idx), solution_(1,1:err_idx), 'b')
title('Equation B, Fwd Euler: Solution curves, Plotted [0, 1e-4]');

%%%%%%%%%%%%%%%%%%%%%%%%%  Backward Euler %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
v = @(x,t) [x(2); -10^4*x(1)];
solution = @(x) [cos(100*x); 0*x];
dv = @(x) [-100*sin(100*x); 0*x];
x0 = [1; 0];
num_pts = 10;
err = 1;
str = sprintf('Equation B, Bwd Euler: Num_pts: %d, Error: %d\n',num_pts, err); disp(str)
n = 0;

while err > 5e-4
    
    err_i = find(tk < 1e-4);
    [junk, err_idx] = size(err_i);
    solution_ = solution(tk);
    intermediate = abs(x - solution_);
    intermediate = intermediate(1, :);
    err = max(intermediate);
    str = sprintf('Equation B, Bwd Euler: Num_pts: %d, Error: %d\n',num_pts, err); disp(str)
    num_pts = num_pts * 2;
end

num_pts = num_pts / 2;

close all;
plot(tk(1,1:err_idx), log10(abs(x(1,1:err_idx) - solution_(1,1:err_idx))))
title('Equation B, Bwd Euler: Error, Plotted [0, 1e-4]');
hold on;

figure;
plot(tk(1,1:err_idx), x(1,1:err_idx), 'r', tk(1,1:err_idx), solution_(1,1:err_idx), 'b')
title('Equation B, Bwd Euler: Solution curves, Plotted [0, 1e-4]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%  RK 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
v = @(x,t) [x(2); -10^4*x(1)];
solution = @(x) [cos(100*x); 0*x];

x0 = [1; 0];
num_pts = 2;
err = 1;
str = sprintf('Equation B, RK4: Num_pts: %d, Error: %d\n',num_pts, err); disp(str)
n = 0;

while err > 5e-4
    [x, tk] = rk4(v, x0, 1/num_pts, num_pts);
    err_i = find(tk < 1e-4);
    [junk, err_idx] = size(err_i);
    solution_ = solution(tk);
    intermediate = abs(x - solution_);
    intermediate = intermediate(1, :);
    err = max(intermediate);
    str = sprintf('Equation B, RK4: Num_pts: %d, Error: %d\n',num_pts, err); disp(str)
    num_pts = num_pts * 2;
end

num_pts = num_pts / 2;

str = sprintf('Equation B, RK4: Num_pts: %d is being plotted',num_pts); disp(str)

close all;

% figure;
% plot(tk, x(1), 'r', tk, solution_(1), 'b')
% title('Solution curves, Plotted [0, 1e-4]');

plot(tk, log10(abs(x(1, :) - solution_(1, :))), 'r');
title('Equation B, RK4: Error, Plotted [0, 1e-4]');
hold on;