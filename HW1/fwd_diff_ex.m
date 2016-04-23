% This Matlab script computes the forward difference approximation for a
% given function (exp(x), in this case), computes the error and produces a
% log-log plot to study behavior as h goes to zero. 
% Math/Engr 371, University of Michigan
% Instructor: Eduardo Corona

fun = @(x) exp(x); % function handle, exponential function
h = 2.^(-1:-1:-10); % array with increasingly small values of h (vectorized)

% produces array h with a for loop
%{
eh = -1:-0.125:-18; 
for i=1:length(eh)
    h(i) = 10^eh(i); 
end
%}

% We will now attempt to approximate f'(0), which we know to be exp(0)=1
% using forward differences, and measure the relative error. 

x = 0; 
nh = length(h); 
Dphf = @(x,h) (fun(x+h)-fun(x))./h; % Forward difference function handle

% Compute forward difference and error (vectorized form, does it entrywise) 
Df = Dphf(x,h);
err = abs(1-Df); 

%{
% way to compute Df and error using a for loop 
err = zeros(nh,1);
non vectorized form (for loop) 
for i=1:nh
    %Df = (fun(x+h(i))-fun(x))/h(i); 
    Df = Dphf(x,h(i)); 
    err(i) = abs(1-Df);
end
%}
fprintf('\n|--%d--|%1.8f|%1.8f|%1.8f|%1.8f|',h,Df)

% Log-log plot of 1/h vs relative error. Until h~1e-8, truncation error
% dominates. After, roundoff error takes over. At h~1e-16 and higher,
% things flatten (as expected, we're in double precision). 
plot(-log10(h),log10(err),'-o')