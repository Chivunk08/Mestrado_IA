
function [M]=mutacao(C,Pm,Rmin,Rmax,Cmin,Cmax)

L = size(C,1);   

for i=1:L    
    for j=1:size(C,2)
        beta=rand(1);    
        if beta<=Pm    
          
            if j<=4 %Resistores                
                M(i,j)=C(i,j)+1000*randn;
                if M(i,j)<Rmin || M(i,j)>Rmax
                    M(i,j)=C(i,j);
                end
            elseif j>4 %Capacitores
                M(i,j)=C(i,j)+1e-6*randn;
                if M(i,j)<Cmin || M(i,j)>Cmax
                    M(i,j)=C(i,j);
                end
            end
        else
            M(i,j)=C(i,j);
        end
    end
end