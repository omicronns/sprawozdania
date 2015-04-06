function [err] = pade2_errc(x0)

a=x0(1);
b=x0(2);
tau=x0(3);

time=[0:0.1:15];
bob=zpk([],linspace(-5,-5,10),5^10);
aob=pade2_apptf(a,b,tau,4);
err=sum((step(aob,time)-step(bob,time)).^2)/length(time);

end

