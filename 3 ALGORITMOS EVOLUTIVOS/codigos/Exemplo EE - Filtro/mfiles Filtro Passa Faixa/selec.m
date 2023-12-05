function [S,fitS]=selec(P,fit)
    %METODO DA ROLETA
L=size(P,1);%tamanho da população        
   prob_acumulado=cumsum(fit)/sum(fit);
    
contador=zeros(1,L);
for i=1:L
    aleatorio(i)=rand(1);
    m(i)=min(find(aleatorio(i)<=prob_acumulado));
    contador(m(i))=contador(m(i))+1;
end
    %Seleçao dos melhores individuos de acordo ao contador
kx=1;
for i=1:L
    if contador(i)~=0
        for(k=1:contador(i))
            S(kx,:)=P(i,:);    %individuos selecionados
            fitS(kx,:)= fit(i);%fit do indiv selecionado
            kx=kx+1;            
        end  
    end
end
