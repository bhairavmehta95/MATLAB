
fun = @(x) sin(x); % function handle, exponential function
h = 2.^(-1:-1:-52); % array with increasingly small values of h (vectorized)
fun_prime = @(x) cos(x);
% produces array h with a for loop

% We will now attempt to approximate f'(0), which we know to be exp(0)=1
% using forward differences, and measure the relative error. 
fn_input = ((fun(x+h)-fun(x-h))./(h.*2));
x = pi/6; 
Dphf = @(x,h) fn_input; % Forward difference function handle
col_3_diff = @(x, h) (fun_prime(x) - ((fun(x+h)-fun(x-h))./(h.*2)));
col_4_diff = @(x,h) (fun_prime(x) - ((fun(x+h)-fun(x-h))./(h.*2))) ./(h.*2);
col_5_diff = @(x,h) (fun_prime(x) - ((fun(x+h)-fun(x-h))./(h.*2))) ./((h.*2).^2);

% Compute forward difference and error (vectorized form, does it entrywise) 
Df = Dphf(x,h);
err = abs(cos(pi/6)-Df); 
col3 = col_3_diff(x,h);
col4 = col_4_diff(x,h);
col5 = col_5_diff(x,h);

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

fprintf('\n|----h----|----error----|----col3----|----4----)|----5----|');
for i=1:52
    fprintf('\n|%d|%d|%1.8f|%1.8f|%1.8f|%1.8f|',i,h(i),Df(i),col3(i), col4(i), col5(i));
end


% Log-log plot of 1/h vs relative error. Until h~1e-8, truncation error
% dominates. After, roundoff error takes over. At h~1e-16 and higher,
% things flatten (as expected, we're in double precision). 
plot(log10(h),log10(err),'-o')