x = [304.5, 305.2, 303.3, 304.9, 304.8, 305.0, 304.6, 305.1, 304.7, 304.9];
z2 = sort(x);
vna = [0, 0, 1.155, 1.496, 1.764, 1.973, 2.139, 2.274, 2.387, 2.482];
mv = mean(z2);
sig = std(z2)
n = length(z2);
cv = [];
ok = 0;
while ok == 0
    idk = [];
    n = length(z2);
    mv2 = mean(z2);
    sig2 = std(z2);
    miu = (max(z2) - mv2)/ sig2
    if miu >= vna(n)
        idk = [idk z2(n)];
        cv = [cv z2(n)];
        z2(n) = [];
    end
    miu = (mv2 - min(z2))/ sig2; 
    if miu >= vna(n)
        idk = [idk z2(1)];
        cv = [cv z2(1)];
        z2(1) = []
    end
    if length(idk) == 0
        ok = 1;
    end
end
mv2 = mean(z2)
sig2 = std(z2)