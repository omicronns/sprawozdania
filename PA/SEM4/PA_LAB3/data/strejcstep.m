function [stepresp] = strejcstep(n,T,k,time)

licz=zeros(1,n);
licz(n)=k/T^n;

stepresp=step(licz,poly(-ones(1,n)/T),time)';

end

