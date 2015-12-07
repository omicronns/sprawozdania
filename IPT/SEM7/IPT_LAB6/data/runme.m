%% Zad 1

close all;
clear all;
load('data_01.mat')

x = x*pi/180;

Ts = 0.01;
delta = 2*pi/2048;
alpha = x(length(x)-1);
xlb = 300;
xub = length(x) - 1800;
x = x(xlb:xub);
t = t(xlb:xub);
t = t - t(1);
clear lb ub

figure
plot(t,x)
xlabel('Time [s]')
ylabel('Angle [Rad]')

fgoalsys = @(c,t,x) (fgoal(@(t,x) fsys(t,x,c(1),alpha,c(2)),t,x,[c(3);c(4)]));

c0 = [2*pi*7/(34.32-14.03);0.012;x(1);(x(2)-x(1))/Ts];
lb = [c0(1)/2;0;c0(3)-1;c0(4)*10];
ub = [c0(1)*2;1;c0(3)+1;c0(4)/10];

options = optimset('display', 'iter');
[copt,~,~,~,~,~,J]=lsqnonlin(@(c) fgoalsys(c,t,x),c0,lb,ub,options);
clear options
% copt = [omega0 xi x0 dx0]

[ts xs] = ode45(@(t,x) fsys(t,x,copt(1),alpha,copt(2)),t,[copt(3);copt(4)]);

err = x - xs(:,1);
n   = sum(abs(err) < delta/2);
sm  = @(s) abs((s^2)/2+log(s)+log(sqrt(2*pi))-log(2*n));
s   = fminbnd(sm,delta/(2*3),delta/(2*0.0001));
g   = 4*copt(2)*(copt(1)^3)*(delta/(2*s))^2;
sx  = delta/(2*s);
sv  = sx;
chi2 = sum(fgoalsys(copt,t,x).^2)/(sv*(length(x)-4));
H=full((J'*J)/length(x));
cerr=diag(var(x - xs(:,1))*(H^-1));

figure
plot(t,x,ts,xs(:,1))
xlabel('Time [s]')
ylabel('Angle [Rad]')
legend('Measure','Model')

figure
plot(t,x - xs(:,1))
xlabel('Time [s]')
ylabel('Angle [Rad]')

%% Zad 2

close all;
clear all;
load('data_02.mat')

x = x*pi/180;

Ts = 0.01;
delta = 2*pi/2048;
alpha = x(length(x)-1);
xlb = 2000;
xub = 15000;
x = x(xlb:xub);
t = t(xlb:xub);
t = t - t(1);
clear lb ub

figure
plot(t,x)
xlabel('Time [s]')
ylabel('Angle [Rad]')

fgoalsys = @(c,t,x) (fgoal(@(t,x) fsys(t,x,c(1),alpha,c(2)),t,x,[c(3);c(4)]));

c0 = [1.658*pi;0.0049;x(1);(x(2)-x(1))/Ts];
lb = [c0(1)/2;0;c0(3)-1;c0(4)*10];
ub = [c0(1)*2;1;c0(3)+1;c0(4)/10];

options = optimset('display', 'iter');
[copt,~,~,~,~,~,J]=lsqnonlin(@(c) fgoalsys(c,t,x),c0,lb,ub,options);
clear options
% copt = [omega0 xi x0 dx0]

[ts xs] = ode45(@(t,x) fsys(t,x,copt(1),alpha,copt(2)),t,[copt(3);copt(4)]);

err = x - xs(:,1);
n   = sum(abs(err) < delta/2);
sm  = @(s) abs((s^2)/2+log(s)+log(sqrt(2*pi))-log(2*n));
s   = fminbnd(sm,delta/(2*3),delta/(2*0.0001));
g   = 4*copt(2)*(copt(1)^3)*(delta/(2*s))^2;
sx  = delta/(2*s);
sv  = sx;
chi2 = sum(fgoalsys(copt,t,x).^2)/(sv*(length(x)-4));
H=full((J'*J)/length(x));
cerr=diag(var(x - xs(:,1))*(H^-1));

figure
plot(t,x,ts,xs(:,1))
xlabel('Time [s]')
ylabel('Angle [Rad]')
legend('Measure','Model')

figure
plot(t,x - xs(:,1))
xlabel('Time [s]')
ylabel('Angle [Rad]')

