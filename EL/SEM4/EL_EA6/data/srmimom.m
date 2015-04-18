%Program wylicza statyczn� zale�no�ci momentu postojowego silnika
%od k�ta wychylenia wirnika oraz prezentuje j� na tle analogicznej
%zale�no�ci pomiarowej (t� trzeba r�cznie wpisa� w tym programie)
%clear; clear all;



%Wyniki pomiar�w:
%Uwaga: moment elektromagnetyczny silnika pomiarowy: Tepom = mgr - Ttarcia
%fipom=[];	%k�ty zmierzone[deg]
%mgr  =[ ];	%momenty zmierzone [Nm]


Ttarcia=0.0037;					%zmierzony moment si� tarcia statycznego [Nm]
Tepom=mgr-Ttarcia; Tepom(1)=0;




%Dane silnika oraz jego zasilania:
Zs=8;		%liczba z�b�w stojana
Zr=6;		%liczba z�b�w wirnika
Lmin=50e-3;	%38.4e-3minimalna indukcyjno�� pasma
Lmax=150e-3;	%maksymalna indukcyjno�� pasma
L1=(Lmax-Lmin)/2; %amplituda 1 harmonicznej indukcyjno�ci pasma
ia=0.9;		%pr�dy pasm [A] 
ib=0; 
ic=0; 
id=0;



%Obliczenie zale�no�ci elektromagnetycznego momentu postojowego silnika od k�ta wychylenia wirnika:
for fist=1:30,	%k�t wychylenia wirnika w [deg]
    fi=fist*(2*pi/360);
    dLa=-L1*Zr*sin(Zr*fi);
    dLb=-L1*Zr*sin(Zr*(fi-1*2*pi/Zs));
    dLc=-L1*Zr*sin(Zr*(fi-2*2*pi/Zs));
    dLd=-L1*Zr*sin(Zr*(fi-3*2*pi/Zs));
    Te(fist)=0.5*(dLa*ia*ia+dLb*ib*ib+dLc*ic*ic+dLd*id*id);
    Fist(fist)=fist;
end;
figure(1); plot(Fist,abs(Te),fipom,Tepom,'+'); grid; ylabel('Te [Nm]'); xlabel('k�t [deg]');
