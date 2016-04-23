%-----------------------------------------------
%HW4.2
%Defining functions
f_x = @(x) exp(1).^(-(x.^2));
g_x = @(y) 1./(1+(2*y.^2));

format long;
n_params = [2 4 8 16 32];
interp_f = [ ];
actual_f = [ ];
diff_f = [ ];
interp_g = [ ];
actual_g = [ ];
diff_g = [ ];

%points that the function will be evaluated at
points = linspace(-1,1,1000);
for i = 1:1000
%points that the function will be evaluated at
    actual_f(i) = f_x(points(i));
    actual_g(i) = g_x(points(i));
end

%F(X) equispaced
figure
for i = 1:5      
        out = lagrange_interp(f_x, n_params(i), points);
        
        %puts into array
        interp_f = out;
        
        %gets difference
        diff_f = (abs(interp_f - actual_f));
        
        plot(points, log10(diff_f));
        hold on;   
        title('4.2: Equispaced F(X)')
end

%Cheb F(X)
figure
for i = 1:5                
        out = lagrange_interp(f_x, n_params(i), points, chebpts(n_params(i)));
        
        %puts into array
        interp_f = out;
        
        %gets difference
        diff_f = (abs(interp_f - actual_f));
        
        plot(points, log10(diff_f));
        hold on;
        title('4.2: Cheb F(X)')
end

% G(x)Equipsaced

figure
for i = 1:5      
        out = lagrange_interp(g_x, n_params(i), points);
        
        %puts into array
        interp_g = out;
        
        %gets difference
        diff_g = (abs(interp_g - actual_g));
        
        plot(points, log10(diff_g));
        hold on;    
        title('4.2: Equispaced G(X)')
end

figure
for i = 1:5                
        out = lagrange_interp(g_x, n_params(i), points, chebpts(n_params(i)));
        
        %puts into array
        interp_g = out;
        
        %gets difference
        diff_g = (abs(interp_g - actual_g));
        
        plot(points, log10(diff_g));
        hold on;
        title('4.2: Cheb G(X)')
end


%2c. I would use the cheb points to approximate both functions because they
%minimze the error of the edges of the function domains (near -1 and 1).
%This is because the Cheb. Points are more densely packed in those areas,
%giving a much better approximation and keeping the error minimized in
%those problematic regions.