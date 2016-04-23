function L = lagrangepoly(xi,y)

n = length(xi);
m = length(y); 
L = zeros(n,m); 

[xxj,xxi] = meshgrid(xi,xi); 
Dx = xxj-xxi + eye(n);
Px = prod(Dx); 

[yyj,yyi] = meshgrid(y,xi);
Dy = yyj-yyi;

for i=1:n
   L(i,:) = prod(Dy([1:i-1 i+1:n],:))./Px(i); 
end
