function [matrix] = hurwitz(Mtr)

for j=1:(length(Mtr)-1)
    for i=1:2*j
        if i<=length(Mtr)
            H(2*j-i+1,j)=Mtr(i);
        else
            H(2*j-i+1,j)=0;
        end
    end
end
matrix=H(1:(length(Mtr)-1),1:(length(Mtr)-1));

