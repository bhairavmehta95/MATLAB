Part iii

define second order differential equation as system of two differential
equations and input inital conditions
clear all

v = @(x,t) [x(2);-552014*sin(x(2))-14321*x(1)];
x0 = [1;0];
num_pts_1 = 2;
err = 1;

%%%%%%%%%%%%%%%%%%%% Forward Euler %%%%%%%%%%%%%%%%%%%%%%%%%
while err > 5e-4
    % For error checking
    num_pts_2 = num_pts_1 * 10;
    
    % Evaluates forward euler at all different timesteps
    [x1, tk] = forward_euler(v, x0, 1/num_pts_1, num_pts_1);
    [x2, tk] = forward_euler(v, x0, 1/num_pts_2, num_pts_2);
    
    % Finds the index, used for plots
    err_i = find(tk < 1e-4);
    [junk, err_idx] = size(err_i);
    
    for i = 1:num_pts_1
       error_1(i) = x1(1, i);
       error_2(i) = x2(1, i*2-1);
    end
    
    err_arr = error_1 - error_2;
    err = max(abs(error_1 - error_2));
    
    str = sprintf('FWE: Num_pts: %d, Error: %d\n',num_pts_1, err); disp(str)
    num_pts_1 = num_pts_1 * 2;
end

plot(tk(1:err_idx), log10(err_arr(1:err_idx)));
title('Equation C, Forward Euler: Error, Plotted [0, 1e-4]');
hold on;
% 
figure;
plot(tk(1:err_idx), x1(1:err_idx), 'r', tk(1:err_idx), x2(1:err_idx), 'b')
title('Equation C, Forward Euler: Solution curves, Plotted [0, 1e-4]');

%%%%%%%%%%%%%%%%% BACKWARD EULER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
str = sprintf('Starting BWE\n'); disp(str)
v = @(x,t) [x(2);-552014*sin(x(2))-14321*x(1)];
dv = @(x,t) [0 1; -14321 -552014*cos(x(2))];
x0 = [1;0];
num_pts_1 = 2;
err = 1;
tol = 1e-8;

while err > 5e-4

    num_pts_2 = num_pts_1 * 2;
    
    [x1, tk] = backward_euler(v, dv, x0, 1/num_pts_1, num_pts_1, tol);
    [x2, tk] = backward_euler(v, dv, x0, 1/num_pts_2, num_pts_2, tol);
    
    %Finds the index, used for plots
    err_i = find(tk < 1e-4);
    [junk, err_idx] = size(err_i);
    
    for i = 1:num_pts_1
       error_1(i) = x1(1, i);
       error_2(i) = x2(1, i*2 - 1);
    end
    
    err_arr = error_1 - error_2;
    err = max(abs(error_1 - error_2));
    
    str = sprintf('BWE: Num_pts: %d, Error: %d\n',num_pts_1, err); disp(str)
    num_pts_1 = num_pts_1 * 2;
end

plot(tk(1:err_idx), log10(err_arr(1:err_idx)));
title('Equation C, BW Euler: Error, Plotted [0, 1e-4]');
hold on;

figure;
plot(tk(1:err_idx), x1(1:err_idx), 'r', tk(1:err_idx), x2(1:err_idx), 'b')
title('Equation C, BW Euler: Solution curves, Plotted [0, 1e-4]');


%%%%%%%%%%%%%%%%%  RK 4   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% str = sprintf('starting RK4 Method, Equation C\n'); disp(str)
% clear all
% 
% v = @(x,t) [x(2);-552014*sin(x(2))-14321*x(1)];
% x0 = [1;0];
% num_pts_1 = 2;
% err = 1;
% 
% while err > 5e-4
%    
%     % For error checking
%     num_pts_2 = num_pts_1 * 10;
%     
%     % Evaluates forward euler at all different timesteps
%     [x1, tk] = rk4(v, x0, 1/num_pts_1, num_pts_1);
%     [x2, tk] = rk4(v, x0, 1/num_pts_2, num_pts_2);
%     
%     % Finds the index, used for plots
%     err_i = find(tk < 1e-4);
%     [junk, err_idx] = size(err_i);
%     
%     for i = 1:num_pts_1
%        error_1(i) = x1(1, i);
%        error_2(i) = x2(1, i*2-1);
%     end
%     
%     err_arr = error_1 - error_2;
%     err = max(abs(error_1 - error_2));
%     
%     str = sprintf('RK4: Num_pts: %d, Error: %d\n',num_pts_1, err); disp(str)
%     num_pts_1 = num_pts_1 * 2;
% end
% 
% plot(tk(1:err_idx), log10(err_arr(1:err_idx)));
% title('Equation C, RK4: Error, Plotted [0, 1e-4]');
% hold on;
% 
% figure;
% plot(tk(1:err_idx), x1(1:err_idx), 'r', tk(1:err_idx), x2(1:err_idx), 'b')
% title('Equation C, RK4: Solution curves, Plotted [0, 1e-4]');




