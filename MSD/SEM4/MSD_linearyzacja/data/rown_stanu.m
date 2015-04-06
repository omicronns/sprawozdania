function [xp] = rown_stanu(t,x,u)

%x=[V T]
%u=[wi w Ti Q] 

C=1820;
ro=1000;

xp(1,1)=(u(2)-u(1))/ro;
xp(2,1)=u(1)*(u(3)-x(2))/(ro*x(1))+u(4)/(ro*x(1)*C);

end

