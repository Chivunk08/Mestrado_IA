function [P,x,fitness] = cruzamento(P,x,fitness,Pc,amin,bmax)

[L,B]=size(P);  

%Probabilidade de cada individuo
r = rand(1,L);

[a,b] = find(r<Pc);


if length(b)>2                      %Verifica que existem pelo menos 2 elementos para cruzamento
    if mod(length(b),2) == 0
        for i = 1 : length(b)/2
            P1 = P(b(i),:);
            P2 = P(b(i+1),:);
            r = randi([2 B-1]); %ponto de cruzamento
            P(b(i),:) = [P1(1:r) P2(r+1:B)];
            P(b(i+1),:) = [P2(1:r) P1(r+1:B)];
        end
    else 
        for i = 1 : (length(b)-1)/2
            P1 = P(b(i),:);
            P2 = P(b(i+1),:);
            r = randi([2 B-1]); %ponto de cruzamento
            P(b(i),:) = [P1(1:r) P2(r+1:B)];
            P(b(i+1),:) = [P2(1:r) P1(r+1:B)];
        end
    end  
end

%Avaliar
Pstring = num2str(P);                   
x = amin + bin2dec(Pstring)*(bmax-amin)/(2^B-1); %Individuos em Valor decimal
fitness = 100-x.^2;                                 %Função de Fitness
