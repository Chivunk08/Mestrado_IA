%Algoritmo Genetico
%Minimizar y=x^2
%a<=x<=b
%Fun��o de Fitnees f=100-x^2      f = 1/(C+x^2)    f =1/(C + abs(x))  
%Autor: Prof. Juan Mauricio Villanueva

clc;clear;close all
warning off

Generacoes = 40;
L = 10;                             %Tamanho da popula��o
Pc = 0.7;                           %Probabilidade de Cruzamento
Pm = 0.01;                           %Probabilidade de Muta��o

a = -10;                            %Limite inferior de x
b = 10;                             %Limite superior de x
N = 3;                              %Precis�o dos valores de x
B = ceil(log2((b-a)*10^N + 1));     %Numero de bits do individuo

%Popula��o Inicial
[P,x,fitness] = populacao(L,B,a,b);
h = waitbar(0,'Em execu��o, ...');
loop = 1;
while (min(fitness)>0)  
    waitbar(loop/Generacoes,h);
    
    %Avalia��o
    [P,x,fitness] = avaliacao(P,a,b,B);  
    f1(loop) = max(fitness);
    P1 = P;
    x1 = x;
    fitness1 = fitness;  %Guardo o fitness da popula��o inicial
    %Sele��o
    [P,x,fitness] = selecao(P,x,fitness);                                 
    %Cruzamento
    [P,x,fitness] = cruzamento(P,x,fitness,Pc,a,b);
    %Muta��o
    [P,x,fitness] = mutacao(P,x,fitness,Pm,a,b);
    f2(loop) = max(fitness);
    %Elitismo
    [P,x,fitness] = elitismo(P,x,fitness,P1,x1,fitness1,a,b);
    f3(loop) = max(fitness);
    
    loop = loop + 1;  
    if loop == Generacoes
        break;
    end
end
loop-1
%Ordenando de Maior a Menor
[a,b] = sort(fitness,'descend');
[x(b) fitness(b)]

%Encontrando o m�ximo do fitness
[m,n]=max(fitness);
Solucao = x(n)
Avaliacao_fitness = fitness(n)


figure
plot(f3)
%axis([0 40 97 101])
xlabel('N�mero de Gera��es')
ylabel('Avalia��o do fitness')
grid