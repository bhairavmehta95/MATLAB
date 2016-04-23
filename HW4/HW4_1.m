%Bhairav Mehta
%HW 4 - Eduardo Corona
 

% 1a.

% for i = 1:length(M1)
%     [~,P1(i)] = chol(M1{i});
%     [~,P2(i)] = chol(M2{i});
%     [~,P3(i)] = chol(M3{i});
%     %used the cholesky facrotization function in matlab to confirm that the
%     %matricies were Symetric Positive Definite
% end

%1.b using condition number function we find the condition number for the
%matricies and it is confirmed what is asked. 

% for i = 1:length(M1)
%     C1{1,i} = cond(M1{i});
%     C1{2,i} = cond(M2{i});
%     C1{3,i} = cond(M3{i});
%     i = i+1;
% end

%%%1.c -------------------------------------
for i = 1:length(M1)
    tic;
    x1 = M1{i}\b{i};
    Tslash{1,i} = toc;
    x2 = M2{i}\b{i};
    Tslash{2,i} = toc;
    x3 = M3{i}\b{i};
    Tslash{3,i} = toc;
    i=i+1;
end

for i = 1:length(M1);
    Maxit_m1 = length(M1{i});
    tic;
    [x_pcg1,flag,relres{1,i},iter{1,i}] = pcg(M1{i},b{i},1e-10,Maxit_m1);
    Tcg{1,i} = toc;
    tic;
    [x_pcg2,flag2,relres{2,i},iter{2,i}] = pcg(M2{i},b{i},1e-10,Maxit_m1);
    Tcg{2,i} = toc;
    tic;
    [x_pcg3, flag3, relres{3,i},iter{3,i}] = pcg(M3{i},b{i},1e-10,Maxit_m1);
    Tcg{3,i} = toc;
end

%%%1.d for HW4
for i = 1:length(M1)
    hold on;
    d_x{i} = log10(length(M1{i}));
    d_slash{1,i} = log10(Tslash{1,i});
    d_pcg{1,i} = log10(Tcg{1,i});
    d_slash{2,i} = log10(Tslash{2,i});
    d_pcg{2,i} = log10(Tcg{2,i});
    d_slash{3,i} = log10(Tslash{3,i});
    d_pcg{3,i} = log10(Tcg{3,i});
    scatter(d_x{i},d_slash{1,i},'r','x');
    scatter(d_x{i},d_slash{2,i},'r','<');
    scatter(d_x{i},d_slash{3,i},'r','s');
    scatter(d_x{i},d_pcg{1,i},'g','x');
    scatter(d_x{i},d_pcg{2,i},'g','<');
    scatter(d_x{i},d_pcg{3,i},'g', 's');
end

for i = 1:length(M1)
    for j = 1:3
         E{j,i} = log10(relres{i});
         itercomparison{j,i} = 2.*((sqrt(C1{j,i})-1)./(sqrt(C1{j,i})+1)).^iter{j,i};
    end
end

%1.d 
% Backslash's performance is purely based on n, while CG is based on
% condition number
% For small n, backslash is better as it takes the form of c1*n^3 (c1 is
% approx. 2/3) and CG takes the form of c2*iter*n^2, but c2*iter can
% potentially be a very big number.
% The graphs of these two functions will eventually cross over at a certain
% n, after which CG will have the better performance.
% This code confirms that the conjugate gradients has timings proportion to
% the matrix apply (O(n^2)).

%1.e
% M1 = 35 iterations
% M2 = ~100 iterations
% M3 = ~1000 iterations
% For CG, the performance depends of K(A) where for backslash, it depends
% on the size of n.
% The numbers come extremely close to the theoretical estimate as given by
% the formula discussed in class.
% 
