function [apptf] = pade2_apptf(a,b,tau,n)

apptfnd=tf([1],[a b 1]);
[padel,padem]=pade(tau,n);
apptf=series(apptfnd,tf(padel,padem));

end