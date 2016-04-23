%Part II: Curvature Flow

%Takes ~30 seconds to run

%Problem 1

clear all
close all

N=100;                     	%Initialize number of time steps
M=32;                      	%Initialize number of 'a' values
h = 2*pi/M;                	%Calculate 'a' step size
k = [0:1:M-1];
a = h*k;                   	%Create vector of 'a' values
x1_0 = (4+cos(3*a)).*cos(a);   %Set initial condition of x1
x2_0 = (4+cos(3*a)).*sin(a);   %Set initial condition of x2

x1a = @(x1) fft_diff(x1,1);	%first partial derivative of x1 in respect to 'a'
x1aa = @(x1) fft_diff(x1,2);   %second partial derivative of x1 in respect to 'a'
x2a = @(x2) fft_diff(x2,1);	%first partial derivative of x2 in respect to 'a'
x2aa = @(x2) fft_diff(x2,2);   %second partial derivative of x2 in respect to 'a'

dt = 4/N;                  	%Step size
Nt = N;                    	%Number of steps


%Define differential equations for x1 and x2

v1 = @(x1,x2,t) x2a(x2).*(((x2a(x2).*(x1aa(x1))-x1a(x1).*x2aa(x2)))./(x1a(x1).^2+x2a(x2).^2).^2);
v2 = @(x1,x2,t) -x1a(x1).*(((x2a(x2).*(x1aa(x1))-x1a(x1).*x2aa(x2)))./(x1a(x1).^2+x2a(x2).^2).^2);

% Solve the first order differential equation using the forward-euler method.  

% Set initial conditions
x1_0 = x1_0(:);
x2_0 = x2_0(:);
dim = size(x1_0,1);
x1 = zeros(dim,Nt+1);
x2 = zeros(dim,Nt+1);
tk = zeros(1,Nt+1);
x1(:,1) = x1_0;
x2(:,1) = x2_0;
tk(1) = 0;

%Run forward euler rule
for k=1:Nt
	tk(k+1) = tk(k)+dt;
	x1(:,k+1) = x1(:,k) + dt*v1(x1(:,k),x2(:,k),tk(k));
	x2(:,k+1) = x2(:,k) + dt*v2(x1(:,k),x2(:,k),tk(k));
end

%Plot curve at 0, 1, 2, 3, and 4 seconds

plot(x1(:,1),x2(:,1),'b') 	%0 sec
hold on;
plot(x1(:,26),x2(:,11),'g')   %1 sec
plot(x1(:,51),x2(:,51),'r')   %2 sec
plot(x1(:,76),x2(:,76),'c')   %3 sec
plot(x1(:,101),x2(:,101),'m') %4 sec
hold off;

title('Curve Shape at t = 0, 1, 2, 3, 4 seconds');
legend('0 sec', '1 sec', '2 sec', '3 sec', '4 sec');

%--------------------------------------------------------------------------

%Problem 3

%Calculate L using N = 400, 800, 1600, 6400

j = 0; %initialize counter

%Run forward euler method exactly as in problem 1, but with different N

for Nb = [400 800 1600 6400]
    
	j = j+1
    
	%Set initial values and constants
	Mb=64;
	kb = [0:1:Mb-1];
	hb = 2*pi/Mb;
	ab = hb*kb;
	x1_0b = (4+cos(3*ab)).*cos(ab);
	x2_0b = (4+cos(3*ab)).*sin(ab);
	dtb = 4/Nb;
	Ntb = Nb;
    
	%Define partial differential equations for x1 and x2 in respect to 'a'
	x1ab = @(x1b) fft_diff(x1b,1);
	x1aab = @(x1b) fft_diff(x1b,2);
	x2ab = @(x2b) fft_diff(x2b,1);
	x2aab = @(x2b) fft_diff(x2b,2);
    
	%Set more initial conditions for euler method
	x1_0b = x1_0b(:);
	x2_0b = x2_0b(:);
	dimb = size(x1_0b,1);
	x1b = zeros(dimb,Ntb+1);
	x2b = zeros(dimb,Ntb+1);
	tkb = zeros(1,Ntb+1);
	x1b(:,1) = x1_0b;
	x2b(:,1) = x2_0b;
	tkb(1) = 0;
    
	%Define differential equations for x1 and x2
	v1b = @(x1b,x2b,tb) x2ab(x2b).*(((x2ab(x2b).*(x1aab(x1b))-x1ab(x1b).*x2aab(x2b)))./(x1ab(x1b).^2+x2ab(x2b).^2).^2);
	v2b = @(x1b,x2b,tb) -x1ab(x1b).*(((x2ab(x2b).*(x1aab(x1b))-x1ab(x1b).*x2aab(x2b)))./(x1ab(x1b).^2+x2ab(x2b).^2).^2);

	%Run forward Euler Rule
	for kb=1:Ntb
    	tkb(kb+1) = tkb(kb)+dtb;
    	x1b(:,kb+1) = x1b(:,kb) + dtb*v1b(x1b(:,kb),x2b(:,kb),tkb(kb));
    	x2b(:,kb+1) = x2b(:,kb) + dtb*v2b(x1b(:,kb),x2b(:,kb),tkb(kb));
	end

	%Define equation to integrate with respect to 'a'
	Y = sqrt(x1ab(x1b).^2+x2ab(x2b).^2);
    
	%Integrate Y using trapezoidal method to get vector of Lengths for the
	%different N values
	L(j) = trapz(Y(:,Nt+1));
end

%Calculate error of lengths for different N values as compared to N = 6400
errL = [L(4)-L(1) L(4)-L(2) L(4)-L(3)];

%--------------------------------------------------------------------------

%Problem 4

Nc=100;                     	%Initialize number of time steps
Mc=64;                      	%Intialize number of 'a' values
hc = 2*pi/Mc;                	%Calculate 'a' step size
kc = [0:1:Mc-1];
ac = hc*kc;                   	%Create vector of 'a' values
x1_0c = (4+cos(3*ac)).*cos(ac);   %Set initial condition of x1
x2_0c = (4+cos(3*ac)).*sin(ac);   %Set initial condition of x2

x1ac = @(x1c) fft_diff(x1c,1);	%first partial derivative of x1 in respect to 'a'
x1aac = @(x1c) fft_diff(x1c,2);   %second partial derivative of x1 in respect to 'a'
x2ac = @(x2c) fft_diff(x2c,1);	%first partial derivative of x2 in respect to 'a'
x2aac = @(x2c) fft_diff(x2c,2);   %second partial derivative of x2 in respect to 'a'

dtc = 4/Nc;                  	%Step size
Ntc = Nc;                    	%Number of steps


%Define differential equations for x1 and x2

v1c = @(x1c,x2c,tc) x2ac(x2c).*(((x2ac(x2c).*(x1aac(x1c))-x1ac(x1c).*x2aac(x2c)))./(x1ac(x1c).^2+x2ac(x2c).^2).^2);
v2c = @(x1c,x2c,tc) -x1ac(x1c).*(((x2ac(x2c).*(x1aac(x1c))-x1ac(x1c).*x2aac(x2c)))./(x1ac(x1c).^2+x2ac(x2c).^2).^2);

% Solve the first order differential equation using the forward-euler method.  

% Set initial conditions
x1_0c = x1_0c(:);
x2_0c = x2_0c(:);
dimc = size(x1_0c,1);
x1c = zeros(dimc,Ntc+1);
x2c = zeros(dimc,Ntc+1);
tkc = zeros(1,Ntc+1);
x1c(:,1) = x1_0c;
x2c(:,1) = x2_0c;
tkc(1) = 0;

%Run forward euler rule
for kc=1:Nt
	tkc(kc+1) = tkc(kc)+dtc;
	x1c(:,kc+1) = x1c(:,kc) + dtc*v1c(x1c(:,kc),x2c(:,kc),tkc(kc));
	x2c(:,kc+1) = x2c(:,kc) + dtc*v2c(x1c(:,kc),x2c(:,kc),tk(kc));
end

%Plot curve at 0, 1, 2, 3, and 4 seconds

figure;

plot(x1c(:,1),x2c(:,1),'b') 	%0 sec
hold on
plot(x1c(:,26),x2c(:,11),'g')   %1 sec
plot(x1c(:,51),x2c(:,51),'r')   %2 sec
plot(x1c(:,76),x2c(:,76),'c')   %3 sec
%plot(x1c(:,101),x2c(:,101),'m') %4 sec

%Did not plot at t = 4 seconds, because the equation becomes stiff, and you
%cannot see the other curves because the solutions increase too much as t
%approaches four



title('Curve Shape at t = 0, 1, 2, 3 seconds with M = 64');
legend('0 sec', '1 sec', '2 sec', '3 sec');


