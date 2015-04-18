%Skrypt rozwi�zuje r�wnania pe�nodynamicznego modelu 4-pasmowego silnika
%skokowego reluktancyjnego (SRM) o zasilaniu napi�ciowym, zawartego 
%w pliku Rsrmu.m. 
%Wszystkie warto�ci w jednostkach uk�adu SI.
clear; clear all;

global Zs Zr R L0 L1 J U D Tz wo


%Dane silnika oraz jego zasilania i obci��enia:
Zs=8;			%liczba z�b�w stojana
Zr=6;			%liczba z�b�w wirnika
R=25;			%rezystancja pasma [om]
Lmin=50e-3;		%minimalna indukcyjno�� pasma [H]
Lmax=150e-3;		%maksymalna indukcyjno�� pasma [H]
L0=(Lmax+Lmin)/2;	%warto�� �rednia indukcyjno�ci pasma 
L1=(Lmax-Lmin)/2;	%amplituda 1 harmonicznej indukcyjno�ci pasma
J=6.4e-6;		%moment bezw�adno�ci silnika (nap�du) [kg*m^2]
U=21;			%napi�cie zasilaj�ce pasmo [V]
wo=2*pi*60;		%55/50(102mH)rusza pulsacja pr�du jednego pasma [Hz]
			%70/60(102 mH) przy 102 mH rusza
D=0.0000001;		%wsp�czynnik t�umienia pr�dko�ciowego ruchu [Nm/(rad/sec)] 
			% - trzeba dobra� go tak, aby nie by�o oscylacji po�o�enia wirnika 
			%   po wykonaniu skoku, ale te� �eby nie by�o nadmiernych opor�w ruchu
Tz=-0.0037;		%moment zewn�trzny [Nm] (tutaj maksymalny moment tarcia statycznego)


%Rozwi�zanie uk�adu r�wna� r�niczkowych modelu silnika:
t0=0; tk=0.4;		%pocz�tkowy i ko�cowy czas symulacji [sec]
X0=[0 0 0 0 0 0];	%warunki pocz�tkowe (pr�dy pasm: A, B, C, D oraz pr�dko�� i k�t po�o�enia wirnika)
blad=[1e-5 1e-5 1e-5 1e-5 1e-5 1e-5];
options=odeset('RelTol',1e-5,'AbsTol',blad);
[t,X] = ode45('Rsrmu',[t0 tk],X0,options);



%Ko�cowa obr�bka wynik�w symulacji:
ia=X(:,1); ib=X(:,2); ic=X(:,3); id=X(:,4); w=X(:,5); fi=X(:,6);	%pr�dy pasm: A, B, C, D oraz pr�dko�� i k�t po�o�enia wirnika

for k=1:size(w),
    dLa=-L1*Zr*sin(Zr*fi(k));			%pochodna indukcyjno�ci pasma A po k�cie po�o�enia wirnika
    dLb=-L1*Zr*sin(Zr*(fi(k)-1*2*pi/Zs));	%pochodna indukcyjno�ci pasma B po k�cie po�o�enia wirnika
    dLc=-L1*Zr*sin(Zr*(fi(k)-2*2*pi/Zs));	%pochodna indukcyjno�ci pasma C po k�cie po�o�enia wirnika
    dLd=-L1*Zr*sin(Zr*(fi(k)-3*2*pi/Zs));	%pochodna indukcyjno�ci pasma D po k�cie po�o�enia wirnika

    Te(k)=0.5*(dLa*ia(k)*ia(k)+dLb*ib(k)*ib(k)+dLc*ic(k)*ic(k)+dLd*id(k)*id(k)); %moment elektromagnetyczny rozwijany przez silnik
    fist(k)=fi(k)*180/pi;			%k�t po�o�enia wirnika w stopniach [deg]
end;

figure(1); plot(t,fist); grid; ylabel('fi [deg]'); xlabel('t [sec]');
figure(2); plot(t,ia); grid; ylabel('ia [A]'); xlabel('t [sec]');
figure(3); plot(t,Te); grid; ylabel('Te [Nm]'); xlabel('t [sec]');
