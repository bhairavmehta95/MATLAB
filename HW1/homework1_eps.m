n = 0;
eps = 2^n;
while (1 + eps > 1)
    eps = 2^n;
    n = n - 1;
end
