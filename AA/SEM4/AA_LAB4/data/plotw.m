function [] = plotw(wave,fp)

time=linspace(0,length(wave)*fp,length(wave));
plot(time,wave,time,ones(length(time),1)*1080,'--')
%plot(time,wave)
axis([0 100 0 6000])
grid
xlabel('Time [s]')
ylabel('Signal [mV]')
legend('Out Signal[mV]', 'In Signal[mV]', 'Location' , 'NorthEast')



end

