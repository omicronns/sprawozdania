function [minors] = hurmin(Mtr)
H=hurwitz(Mtr);
for i=1:length(H)
    minors(i)=det(H(1:i,1:i));
end
