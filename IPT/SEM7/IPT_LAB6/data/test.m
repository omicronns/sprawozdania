%% Zad 1

close all;
clear all;
load('data_01.mat')

delta = 360/2048;
x0 = mean(x(1:100));
x0sd = std(x(1:100));
alpha = mean(x(length(x)-100:length(x)));
alphasd = std(x(length(x)-100:length(x)));
lb = find(x < (x0 - 3*x0sd),1,'first');
ub = find(x < (alpha - 3*alphasd),1,'last');
x = x(lb:ub);
t = t(lb:ub); t = t - t(1);
clear lb ub x0sd alphasd

fgoal1 = @(c,t,x) (fgoal(@(t,x) fsys1(t,x,c(1),alpha,c(2)),t,x,[x0;0]));

c = [16.5 0.0017];

ode1fun = @(t,x) fsys1(t,x,c(1),alpha,c(2));
[ts ys] = ode45(ode1fun, t, [x0;0]);

figure
hold on
plot(t,x)
plot(ts,ys(:,1),'r')

