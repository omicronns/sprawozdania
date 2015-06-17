clear all
close all

%% 7.1

num=[1];
den=[1,1];
system(1)=tf(num,den);

num=[1];
den=[2,0,1];
system(2)=tf(num,den);

num=[1];
den=[1,-0.1];
system(3)=tf(num,den);

for it=1:3
    figure
    title('System ciagly z zoh')
    [A B C D]=tf2ss(system(it).num{1}, system(it).den{1});
    cdst = 0.1;
    sim('disc_sys');
    subplot(3,1,1)
    plot(tout, cdy)
    cdst = 0.5;
    sim('disc_sys');
    subplot(3,1,2)
    plot(tout, cdy)
    cdst = 1;
    sim('disc_sys');
    subplot(3,1,3)
    plot(tout, cdy)
    xlabel('t[s]')
end

%% 7.5

figure
hold on
title('Trojkat sierpinskiego')
x = [0;0];
A = [0.5 0; 0 0.5];
b = [0 ; 0];
b = [b [0.5 ; 0]];
b = [b [0.25 ; 0.25]];
for it=1:10000
    x = A*x + b(:,floor(rand()*3+1));
    plot(x(1), x(2))
end

%% 7.6

figure
hold on
title('Odwzorowanie logistyczne')
for miu=0:0.01:4
    x = 0.5;
    for it=1:750
        x = miu*x*(1 - x);
    end
    for it=1:250
        x = miu*x*(1 - x);
        plot(miu, x)
    end
end
