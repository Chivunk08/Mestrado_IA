function [fit]=fitness(P,fc1,fc2,bQ,bK)
    
    Ra = P(:,1);
    Rb = P(:,2);
    Rf = P(:,3);
    Ri = P(:,4);
    Ca = P(:,5);
    Cb = P(:,6);

    Wc1 = (Ra.*Ca).^(-1);
    Wc2 = (Rb.*Cb).^(-1);
    Q = sqrt(Wc1.*Wc2)./(Wc2-Wc1);
    K = Rf./Ri;

    fWc1 = (Wc1 - 2*pi*fc1).^2;
    fWc2 = (Wc2 - 2*pi*fc2).^2;
    fQ = (Q-bQ).^2;
    fK = (K-bK).^2;
    fit = (fWc1 + fWc2 + fQ + fK)/4;
    
end