function [P,x,fitness] = selecao(P,x,fitness)

L = length(x);              %Tamanho da População

F = sum(fitness);

ProbSelecao = fitness/F;  %Probabilidade de Seleção

%Probabilidade Acumulativa: q
q = cumsum(ProbSelecao);

%Geramos "L" Numeros Aleatorios
r = rand(1,L);

%Comparamos q<=r para selecionar os novos individuos
for i = 1 : L
    [a,b] = find(r(i)<=q);
    indiceSelecionado(i) = a(1);
end

Pselecionado = P(indiceSelecionado',:);
xSelecionado = x(indiceSelecionado');
fitnessSelecionado = fitness(indiceSelecionado');

%Nova População
P = Pselecionado;
x = xSelecionado;
fitness = fitnessSelecionado;






