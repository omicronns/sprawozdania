function [RMSb] = autb(x0)
%x0=[k,T1,T2,theta]
global y;

Gb=tf([x0(1)],[x0(2)*x0(3) x0(2)+x0(3) 1]);
set(Gb,'outputdelay',x0(4));
yb=step(Gb,[1:60]);
e=y-yb;
RMSb=sum(e.^2)/length(e);

end

