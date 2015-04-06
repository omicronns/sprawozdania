function [RMSc] = autc(x0)
%x0=[k,T]
global y;
global n;

Gc=zpk([],ones(n,1)*-1/x0(2),x0(1)/x0(2)^n);
yc=step(Gc,[1:60]);
e=y-yc;
RMSc=sum(e.^2)/length(e);

end