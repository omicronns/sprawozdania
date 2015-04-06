function [RMSa] = auta(x0)
%x0=[k,T,theta]
global y;

Ga=tf([x0(1)],[x0(2) 1]);
set(Ga,'outputdelay',x0(3));
ya=step(Ga,[1:60]);
e=y-ya;
RMSa=sum(e.^2)/length(e);

end

