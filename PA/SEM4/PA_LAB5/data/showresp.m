function [isstable]=showresp(k,Ti,Td,Time)

[isstable,GzL,GzM]=uklzamstab(k,Ti,Td);
resp=step(GzL,GzM,Time);
plot(Time,resp)
grid
xlabel('Time [s]')
ylabel('Response [-]')