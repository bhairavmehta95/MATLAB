%Part iii

%define second order differential equation as system of two differential
%equations and input inital conditions
clear all

v = @(x,t) [x(2);-552014*sin(x(2))-14321*x(1)];
x0 = [1;0];

%Forward Euler

%Initialize dt1, Nt1
dt1 = .1;
Nt1 = dt1.^(-1);

%Initialize solution vector and solution vector to test error  for while
%loop

testSolVec1 = [1:1:Nt1*2+1];
testerrSolVec1 = [1:1:Nt1*10*2+1];

%Initialize counter
i = 0;

%While loop checks to see if the difference between the solutions and the
%solutions of the next iteration with steps multiplied by two is withing 3
%digits of accuracy

%While the loop runs, the steps multiply by 2 until the desired error is
%met

while max(abs(testSolVec1([1:1:Nt1/2+1])-testerrSolVec1([1:2:Nt1*2/2+1])))>5*10^(-4)
	i = i + 1;
	[solVec1,tVec1] = forward_euler(v,x0,dt1,Nt1);
	[errSolVec1,errtVec1] = forward_euler(v,x0,dt1/2,Nt1*2);
	dt1 = dt1/2;
	Nt1 = dt1.^(-1);
	testSolVec1 = solVec1(1,:);
	testerrSolVec1 = errSolVec1(1,:);
	x(i) = max(abs(testSolVec1([1:1:Nt1/2+1])-testerrSolVec1([1:2:Nt1*2/2+1])));
end
 
plot(tVec1,solVec1(1,:),'b')
hold on
dv = @(x,t) [0 1; -14321 -552014*cos(x(2))];
dt2 = .1;
Nt2 = dt2.^(-1);
tol = 10.^(-8);
j = 0;
testSolVec2 = [1:1:Nt2*2+1];
testerrSolVec2 = [1:1:Nt2*10*2+1];
while max(abs(testSolVec2([1:1:Nt2/2+1])-testerrSolVec2([1:2:Nt2*2/2+1])))>5*10^(-4)
	j = j + 1;
	[solVec2,tVec2] = backward_euler(v,dv,x0,dt2,Nt2,tol);
	[errSolVec2,errtVec2] = backward_euler(v,dv,x0,dt2/2,Nt2*2,tol);
	dt2 = dt2/2;
	Nt2 = dt2.^(-1);
	testSolVec2 = solVec2(1,:);
	testerrSolVec2 = errSolVec2(1,:);
	x(j) = max(abs(testSolVec2([1:1:Nt2/2+1])-testerrSolVec2([1:2:Nt2*2/2+1])));
end
plot(tVec2,solVec2(1,:),'g')
dt3 = .1;
Nt3 = dt3.^(-1);
testSolVec3 = [1:1:Nt3*+1];
testerrSolVec3 = [1:1:Nt3*10*2+1];
k = 0;

while max(abs(testSolVec3([1:1:Nt3/2+1])-testerrSolVec3([1:2:Nt3*2/2+1])))>5*10^(-4)
	k = k + 1;
	[solVec3,tVec3] = rk4(v,x0,dt3,Nt3);
	[errSolVec3,errtVec3] = rk4(v,x0,dt3/2,Nt3*2);
	dt3 = dt3/2;
	Nt3 = dt3.^(-1);
	testSolVec3 = solVec3(1,:);
	testerrSolVec3 = errSolVec3(1,:);
	x(k) = max(abs(testSolVec3([1:1:Nt3/2+1])-testerrSolVec3([1:2:Nt3*2/2+1])));
end
  plot(tVec3,solVec3(1,:),'g')

Nt1
Nt2
Nt3



