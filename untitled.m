%citire date
[date,text] = xlsread('Date_temp.xls')
%extragere date de temperatura
v = date(:,2)';
%calcul medie aritmetica
m = mean(v)
%estimatia=deviatia standard
sigma = std(v)
n = length(v)
%creare histograma
figure(1)
hist(v)
title('Histograma cu datele initiale')
%testul 3sigma
X = [];
cv = [];
zl = [];
ok = 0;
while ok == 0
    n = length(v);
    cv = [];
    X = [];
    m = mean(v);
    sigma = std(v);
    for i = 1:n
        if v(i) > m + 3 * sigma
            X = [X v(i)];
            zl = [zl v(i)];
        elseif v(i) < m - 3 * sigma
            X = [X v(i)];
            zl = [zl v(i)];
        else 
            cv = [cv v(i)];
        end
    end
    if length(X) == 0
       ok = 1;
    end
    v = cv;
end
%calcul medie aritmetica noua
m2 = mean(cv)
%estimatia=deviatia standard noua
sigma2 = std(cv)
n2 = length(cv)
%creare histograma
figure(2)
hist(cv)
title('Histograma dupa testul 3*sigma')