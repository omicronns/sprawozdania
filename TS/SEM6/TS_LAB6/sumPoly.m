function [ P ] = sumPoly( Q, R )
    if(length(Q) > length(R))
        G = Q;
        L = R;
    else
        G = R;
        L = Q;
    end
    L = [zeros(1,length(G)-length(L)) L];
    P = G + L;
end

