%% Man

Gc=zpk([],ones(n,1)*-1/Tc,kc/Tc^n);
yc=step(Gc,[1:60]);
plot([1:60],y,[1:60],yc);
e=y-yc;
RMSc=sum(e.^2)/length(e);
