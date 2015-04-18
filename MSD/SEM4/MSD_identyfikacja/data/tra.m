Ga=tf([k],[Ta 1]);
set(Ga,'outputdelay',thetaa);
ya=step(Ga,[1:60]);
plot([1:60],y,[1:60],ya);
e=y-ya;
RMSa=sum(e.^2)/length(e);