function [] = plotzbr(t,y)

figure(1)

subplot(2,1,1)
plot(t, y(:,1))
grid
xlabel('Time [s]')
ylabel('Volume [m^3]')
axis([t(1) t(length(t)) 0 0.06])
subplot(2,1,2)
plot(t, y(:,2))
grid
xlabel('Time [s]')
ylabel('Temperature [K]')
end

