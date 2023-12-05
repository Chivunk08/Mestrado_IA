function [C]=cruzamento(S,fitS,Pc)

L =size(S,1);        
%Probabilidade de cada individuo
Probabilidade=rand(1,L);
k=1;
m=1;
no_cruze=0;
for i=1:L
    if Probabilidade(i)<=Pc
        cruze(k)=i;    %indice dos individuos a serem cruzados
        k=k+1;
    else
        no_cruze(m)=i;
        m=m+1;
    end
end
if mod(length(cruze),2)~=0
    cruze(length(cruze)+1)=randi([1,L]);
    no_cruze=no_cruze(1,1:length(no_cruze)-1);
end

num_cruze=length(cruze);
if no_cruze==0
    num_ncruze=0;
else
    num_ncruze=length(no_cruze);
end   
%cruze   ->Indice dos individuos que se vão cruzar
%no-cruze->Indice dos individuos que não se vão cruzar

%***************************************************************
%CRUZAMENTO DE X
for i=1:length(cruze)/2  
    alfa = rand;
    C(2*i-1,:)= alfa*S(cruze(2*i-1),:)+(1-alfa)*S(cruze(2*i),:);
    C(2*i,:)  = alfa*S(cruze(2*i),:)  +(1-alfa)*S(cruze(2*i-1),:);           
end

if no_cruze~=0
    for i=length(cruze)+1:L
        C(i,:) = S(no_cruze(i-length(cruze)),:);
    end
end
