%% Zad 1

close all;
clear all;
load('data_01.mat')

x = x*pi/180;

figure
plot(t,x)

Ts = 0.01;
delta = 360/2048;
alpha = x(length(x)-1);
xlb = 300;
xub = length(x) - 1800;
x = x(xlb:xub);
t = t(xlb:xub);
t = t - t(1);
clear lb ub

fgoal1 = @(c,t,x) (fgoal(@(t,x) fsys1(t,x,c(1),alpha,c(2)),t,x,[c(3);c(4)]));

c0 = [2*pi*7/(34.32-14.03);0.012;x(1);(x(2)-x(1))/Ts];
lb = [c0(1)/2;0;c0(3)-1;c0(4)*10];
ub = [c0(1)*2;1;c0(3)+1;c0(4)/10];

options = optimset('display', 'iter');
copt=lsqnonlin(@(c) fgoal1(c,t,x),c0,lb,ub,options);
clear options

[ts xs] = ode45(@(t,x) fsys1(t,x,copt(1),alpha,copt(2)),t,[copt(3);copt(4)]);

figure
plot(t,x,ts,xs(:,1))

figure
plot(t,x - xs(:,1))

