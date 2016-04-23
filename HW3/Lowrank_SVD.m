function B = Lowrank_SVD(A,tol)
%{
This function uses the SVD to find a low rank approximation so that 
                           || A - B ||_2 < tol ||A||_2
By truncating the SVD appropriately. 
%}

% SVD
[U,S,V] = svd(A); 
% singular values
ss = diag(S); 

% eps-rank -> # of singular values with relative size > tol
rk = sum(ss./max(ss)>tol); 

B = U(:,1:rk)*S(1:rk,1:rk)*V(:,1:rk)'; 

display(rk);
normdiff = norm(A) - norm(B);

display(normdiff);


end