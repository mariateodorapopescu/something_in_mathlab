%citire date
[date,text] = xlsread('Note_stud.xls')
%extragere date de temperatura
x = date';
%calcul medie aritmetica
med_aritm = mean(x)
%estimatia=deviatia standard
estimatia = std(x)
dimensiune = length(x)
%creare histograma
figure(1)
hist(x)
title('Histograma cu datele initiale')
%testul 3sigma
y = [];
xx = [];
for i = 1:dimensiune
if x(i) > med_aritm + 3 * estimatia
y = [y x(i)];
elseif x(i) < med_aritm - 3 * estimatia
y = [y x(i)];
else xx = [xx x(i)];
end
end
%calcul medie aritmetica noua
med_aritm_nou = mean(xx)
%estimatia=deviatia standard noua
estimatia_nou = std(xx)
dimensiunex = length(xx)
%creare histograma
figure(2)
hist(xx)
title('Histograma dupa testul 3*sigma')