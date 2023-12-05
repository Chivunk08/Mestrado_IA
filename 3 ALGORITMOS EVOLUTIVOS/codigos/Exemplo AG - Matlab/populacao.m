function [P,x,fitness]=populacao(L,B,a,b)

P = round(rand(L,B));                   %Populacao Inicial

Pstring = num2str(P);                   

x = a + bin2dec(Pstring)*(b-a)/(2^B-1); %Individuos em Valor decimal

fitness = 100-x.^2;                         %Função de Fitness
