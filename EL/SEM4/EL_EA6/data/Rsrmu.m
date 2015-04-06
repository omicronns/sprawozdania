function dX=Rsrmu(t,X)
%Liniowy model silnika skokowego reluktancyjnego 8/6 (SRM 8/6)
%z zasilaniem napi�ciowym.
%Dotyczy silnika LD20ACM-25 (LD20ACM-9).

dX=zeros(6,1);
global Zs Zr R L0 L1 J U D Tz wo
ia=X(1); ib=X(2); ic=X(3); id=X(4); w=X(5); fi=X(6);	%pr�dy pasm: A, B, C, D oraz pr�dko�� i k�t po�o�enia wirnika
X=[ia;
   ib;
   ic;
   id;
   w;
   fi]; 


%Poni�ej nale�y wybra� rodzaj sterowania pasm silnika:

%Sterowanie unipolarne pe�noskokowe:
warunek=sin(45*pi/180);
if sin(wo*t+(45-0)*pi/180)>warunek,   Ud=U; else Ud=0; end;
if sin(wo*t+(45-90)*pi/180)>warunek,  Uc=U; else Uc=0; end;
if sin(wo*t+(45-180)*pi/180)>warunek, Ub=U; else Ub=0; end;
if sin(wo*t+(45-270)*pi/180)>warunek, Ua=U; else Ua=0; end;

%Sterowanie unipolarne p�skokowe:
%warunek=sin(22.5*pi/180);
%if sin(wo*t+(22.5-0)*pi/180)>warunek,   Ud=U; else Ud=0; end;
%if sin(wo*t+(22.5-90)*pi/180)>warunek,  Uc=U; else Uc=0; end;
%if sin(wo*t+(22.5-180)*pi/180)>warunek, Ub=U; else Ub=0; end;
%if sin(wo*t+(22.5-270)*pi/180)>warunek, Ua=U; else Ua=0; end;


%R�wnania silnika:
dLa=-L1*Zr*sin(Zr*fi);			%pochodna indukcyjnosci pasma A po k�cie po�o�enia wirnika
dLb=-L1*Zr*sin(Zr*(fi-1*2*pi/Zs));	%pochodna indukcyjnosci pasma B po k�cie po�o�enia wirnika
dLc=-L1*Zr*sin(Zr*(fi-2*2*pi/Zs));	%pochodna indukcyjnosci pasma C po k�cie po�o�enia wirnika
dLd=-L1*Zr*sin(Zr*(fi-3*2*pi/Zs));	%pochodna indukcyjnosci pasma D po k�cie po�o�enia wirnika
La=L0+L1*cos(Zr*fi);			%indukcyjno�� pasma A
Lb=L0+L1*cos(Zr*(fi-1*2*pi/Zs));	%indukcyjno�� pasma B
Lc=L0+L1*cos(Zr*(fi-2*2*pi/Zs));	%indukcyjno�� pasma C
Ld=L0+L1*cos(Zr*(fi-3*2*pi/Zs));	%indukcyjno�� pasma D

dX(1)=(Ua-R*ia-dLa*w*ia)/La;		%r�wnanie napi�ciowe pasma A
dX(2)=(Ub-R*ib-dLb*w*ib)/Lb;		%r�wnanie napi�ciowe pasma B
dX(3)=(Uc-R*ic-dLc*w*ic)/Lc;		%r�wnanie napi�ciowe pasma C
dX(4)=(Ud-R*id-dLd*w*id)/Ld;		%r�wnanie napi�ciowe pasma D
Te=0.5*(dLa*ia*ia+dLb*ib*ib+dLc*ic*ic+dLd*id*id);	%moment elektromagnetyczny rozwijany przez silnik
dX(5)=(Te-D*w+Tz)/J;			%r�wnanie moment�w na wale silnika
dX(6)=w;				%pr�dko�� obrotowa wirnika

fist=fi*180/pi;				%k�t po�o�enia wirnika w stopniach [deg]
