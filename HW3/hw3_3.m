%plot the original graph
t = .01*pi:.01*pi:pi;
figure
plot(t,X)
legend('1','sin(x)','cos(x)','sin(x)cos(x)','sin(x)^2','cos(x)^2')

%%%% part b
alpha1 = pinv(X)*(Y);
alpha2 = pinv(X)*(Y2);
alpha3 = pinv(X)*(Y3);


% alpha_1 is not the only solution to this equation, but rather the 
% solution with the minimum norm

% A1 = reshape(alpha1,[100,1]);
% A2 = reshape(alpha2,[100,1]);
% A3 = reshape(alpha3,[100,1]);

%find the residual
residual_1 = (abs(Y-X*alpha1)).^2;
residual_2 = (abs(Y2-X*alpha2)).^2;
residual_3 = (abs(Y3-X*alpha3)).^2;

%plots Y2 vs X*aplha2
figure
t2 = .01*pi:.01*pi:pi;
plot(t2, Y2, 'o');
hold on;
plot(t2, X*alpha2, '-r');
title('Y2 vs X*alpha')

%plots Y3 vs X*alpha3
figure
plot(t2, Y3, 'o');
hold on;
plot(t2, X*alpha3, '-r');
title('Y3 vs X*alpha')


