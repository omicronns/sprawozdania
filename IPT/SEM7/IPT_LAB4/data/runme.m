%% Zad 1

clear all
close all

load('data_01.mat')

wpart = floor(length(u)/4);
Clsq = calc_coofs(u,y,1);
ym = amax(Clsq,u,1);
un = [1:wpart]';

phi = calc_phi(u,y,1);
ErrLsq = sqrt(diag(var(ym-y)*(phi'*phi)^-1))

ys = iddata(y,u,1);
M = armax(ys,[1 1 0 1])
ErrArmax = sqrt(diag(getcov(M)))

figure
plot(un,y(1:wpart),un,ym(1:wpart))
xlabel('Sample [-]');
ylabel('Value [-]');
legend('Measure','Approximate');

figure
plot(linspace(0,1,length(y)),abs(fft(y-ym)))
xlabel('Frequency/SampleFrequency [-]');
ylabel('Value [-]');

%% Zad 2

clear all
close all

load('data_02.mat')

wpart = floor(length(u)/6.5);
Clsq = calc_coofs(u,y,2);
ym = amax(Clsq,u,2);
un = [1:wpart]';

phi = calc_phi(u,y,2);
ErrLsq = sqrt(diag(var(ym-y)*(phi'*phi)^-1))

ys = iddata(y,u,1);
M = armax(ys,[2 2 0 1])
ErrArmax = sqrt(diag(getcov(M)))

figure
plot(un,y(1:wpart),un,ym(1:wpart))
xlabel('Sample [-]');
ylabel('Value [-]');
legend('Measure','Approximate');

figure
plot(linspace(0,1,length(y)),abs(fft(y-ym)))
xlabel('Frequency/SampleFrequency [-]');
ylabel('Value [-]');
