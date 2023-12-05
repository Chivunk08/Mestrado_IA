function [P,x,fitness] = avaliacao(P,a,b,B)

Pstring = num2str(P);                   

x = a + bin2dec(Pstring)*(b-a)/(2^B-1);  %Individuos em Valor decimal

fitness = 100-x.^2;                         %Função de Fitness
