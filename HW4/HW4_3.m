% ---------------------------------------------------------------
% HW 4.3


%function definition and points
h_x = @(x) sqrt(1-x^2);
x_i = linspace(-1,1,17);

%evaluate at equspaced points
for i = 1:17
    y(i) = h_x(x_i(i));
end

%points to approximate with
points = linspace(-1,1,1000);

%interpolations
cubic = interp1(x_i, y , points, 'CUBIC');
linear = interp1(x_i, y , points, 'LINEAR');

%true values
for i = 1:1000
    actual(i) = h_x(points(i));
end

%plots
plot(linspace(-1,1,1000), log10(actual-cubic),'b');
hold on;
plot(linspace(-1,1,1000), log10(actual-linear), 'r');
title('Cubic in Blue, Linear In Red');

% ANSWER TO 3a:
% -----------------
% From these plots, you can see for both the error blows up at the edges,
% but the cubic interpolate (in blue) is a much better interpolant because
% it has more data to interpolate with, making it a better approximation.
% It clearly has a lower error for almost all points when compared with the
% true values.

cubpp = interp1(x_i, y, 'CUBIC', 'pp');
linpp = interp1(x_i, y, 'LINEAR', 'pp');

% The linear approximation to h'(x)
h_prime_lin = linpp.coefs(:,1);

%Cubic approximation to h'(x)

h_prime_cub = zeros(17,3);
for i = 1:16
   h_prime_cub(i,1) = 3*cubpp.coefs(i,1);
   h_prime_cub(i,2) = 2*cubpp.coefs(i,2);
   h_prime_cub(i,3) = cubpp.coefs(i,3);
end