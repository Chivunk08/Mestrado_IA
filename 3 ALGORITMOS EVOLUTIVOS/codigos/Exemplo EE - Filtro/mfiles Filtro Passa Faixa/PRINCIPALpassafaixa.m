%Programa principal
clear;
clc;
close all

%Caracteristicas do filtro Passa Faixa

fc1 = 100;          %Frequencia de corte inferior
fc2 = 10000;        %Frequencia de corte superio
bK = 2;             %Ganho do est�gio de sa�da
bQ = sqrt(fc1*fc2)/(fc2-fc1); % Fator de Qualidade


L=100;          % Tamanho da popula��o
epocas=1000;    % N�mero de gera��es
mutProb=0.008;  % Probabilidade de muta��o
crossProb=0.65; % Probabilidade de cruzamento

%Restri��es dos componentes
Rmin = 10;
Rmax = 10e3;
Cmin = 10e-9;
Cmax = 500e-6;
psense = 0.01;   %margem de precis�o das frequencias de corte

P = [(Rmin+(Rmax-Rmin).*rand(L,4)) (Cmin+(Cmax-Cmin).*rand(L,2))]; %[Ra Rb Rf Ri Ca Cb]
fit = fitness(P, fc1, fc2, bQ, bK);

Fc1 = 0;
Fc2 = 0;
count =0;
while (1)
    for i=1:epocas
        
        [c,d]=sort(fit');
        
        %Sele��o
        [S,fitS]=selec(P,fit);
        
        %Cruzamento
        [C]=cruzamento(S,fitS,crossProb);
        %Muta��o
        [M]=mutacao(C,mutProb,Rmin,Rmax,Cmin,Cmax);
        
        %Avalia��o - Elitismo
        [fitM] = fitness(M, fc1, fc2, bQ, bK);
        
        %melhor individuo e substitui��o dos 5 melhores da nova popula��o
        %pelos 5 piores da popula��o original
        [a,b]=sort(fitM');
        
        P(d(L-4:L),:)=M(b(1:5),:);
        fit(d(L-4:L)) = fitM(b(1:5));
        
        R = P(b(1),:);
        
        %Armazena o melhor fitness da popula��o atual (minimo)               
        Prodigio(i) = min(fit); 
        
    end
    
    Ra = R(:,1);
    Rb = R(:,2);
    Rf = R(:,3);
    Ri = R(:,4);
    Ca = R(:,5);
    Cb = R(:,6);
    
    Fc1 = (Ra.*Ca).^(-1)/(2*pi)
    Fc2 = (Rb.*Cb).^(-1)/(2*pi)
    count = count + 1
    if (fc1-psense*fc1) <Fc1 && Fc1< (fc1+psense*fc1) && (fc2-psense*fc1) < Fc2 && Fc2<(fc2+psense*fc1)
        break
    end
end

figure
plot(Prodigio)
ylabel('fitness')
xlabel('N�mero de Gera��es')


Ra = R(:,1);
Rb = R(:,2);
Rf = R(:,3);
Ri = R(:,4);
Ca = R(:,5);
Cb = R(:,6);

Fc1 = (Ra.*Ca).^(-1)/(2*pi)
Fc2 = (Rb.*Cb).^(-1)/(2*pi)
Q = sqrt(Fc1.*Fc2)./(Fc2-Fc1)
K = Rf./Ri
disp('[Ra Rb Rf Ri]')
R(1:4)
disp('[Ca Cb]')
R(5:6)

%Fun��o de Transferencia
num = [-K*Fc2*2*pi 0];
den = [1 (Fc1+Fc2)*2*pi Fc1*Fc2*2*pi*2*pi];

%Resposta em Frequ�ncia (diagrama de bode)
figure
freqs(num,den);

