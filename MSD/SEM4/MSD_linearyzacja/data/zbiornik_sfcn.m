function [sys,x0,str,ts]=zbiornik_sfcn(t,x,u,flag,V0,T0) 

switch flag 
     case 0     % inicjalizacja 
          str = []; 
          ts = [0 0]; 
          s = simsizes; 
               s.NumContStates = 2;           % liczba stan�w ci�g�ych 
               s.NumDiscStates = 0;           % liczba stan�w dyskretnych 
               s.NumOutputs = 2;              % liczba wyj�� 
               s.NumInputs = 4;               % liczba wej�� 
               s.DirFeedthrough = 0;          % wej�cie nie przenosi si� bezpo�rednio na wyj�cie 
               s.NumSampleTimes = 1;          % czas pr�bkowania 
          sys = simsizes(s); 
          x0 = [V0, T0]; 
     case 1     % pochodne 
          sys = rown_stanu(t,x,u); 
     case 3     % wyj�cie 
          sys = x; 
     case {2 4 9} 
          sys =[]; 
     otherwise 
          error([ 'unhandled flag =',num2str(flag)]); 
end 