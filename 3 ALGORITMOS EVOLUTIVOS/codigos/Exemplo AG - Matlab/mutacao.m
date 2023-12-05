function [P,x,fitness] = mutacao(P,x,fitness,Pm,a,b)

[L,B]=size(P);  

%Probabilidade de cada individuo
r = rand(L,B);

[m,n] = find(r<Pm);

for i = 1 : length(m)
    if P(m(i),n(i)) == 1
        P(m(i),n(i))=0;
    else
        P(m(i),n(i))=1;
    end
end

%Avaliar
Pstring = num2str(P);                   
x = a + bin2dec(Pstring)*(b-a)/(2^B-1);  %Individuos em Valor decimal
fitness = 100-x.^2;                         %Função de Fitness
