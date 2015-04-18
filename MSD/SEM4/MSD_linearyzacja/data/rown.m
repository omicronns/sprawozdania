function [xp] = rown(t,x,wi,w,Ti,Q)

%x=[V,T]

C=1820;
ro=1000;

xp(1,1)=(w-wi)/ro;
xp(2,1)=wi*(Ti-x(2))/(ro*x(1))+Q/(ro*x(1)*C);

end

