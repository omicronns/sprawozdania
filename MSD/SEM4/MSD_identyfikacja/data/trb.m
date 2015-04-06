%% Man

Gb=tf([kb],[T1*T2 T1+T2 1]);
set(Gb,'outputdelay',thetab);
yb=step(Gb,[1:60]);
plot([1:60],y,[1:60],yb);
e=y-yb;
RMSb=sum(e.^2)/length(e);

