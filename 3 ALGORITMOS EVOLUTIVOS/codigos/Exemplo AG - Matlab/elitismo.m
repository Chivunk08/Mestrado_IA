function [P,x,fitness] = elitismo(P,x,fitness,P1,x1,fitness1,a,b)
%fitness = resultado do processo de evolução - filhos
%fitness1 = avaliação da população inicial - pais

[L,B]=size(P);  

%Ordenamento de maior a menor
[m,n] = sort(fitness,'descend');
xbest = x(n(1));
fitnessbest = fitness(n(1)); %melhor filho apos a mutação
Ibest = P(n(1),:);

%Ordenamento de maior a menor
[m1,n1] = sort(fitness1,'descend');
x1worst = x1(n1(end));  %o pior pai da população inicial, antes da seleção
fitness1worst = fitness1(n1(end));
I1worst = P1(n1(end),:);


%Substituição do Melhor Filho pelo Pior Pai
P1(n1(end),:) = P(n(1),:);
fitness1(n1(end)) = fitness(n(1));
x1(n1(end)) = x(n(1));

P = P1;
fitness = fitness1;
x = x1;



% P(n(end),:) = Ibest;
% x(n(end)) = xbest;
% fitness(n(end)) = fitness1best;