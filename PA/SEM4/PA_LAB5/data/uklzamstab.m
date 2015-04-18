function [isstable,GzL,GzM] = uklzamstab(k,Ti,Td)
T=0.01;
GoL=[10];
GoM=[1 2 2 1];

[GrL GrM]=parallel([k],[1],[k],[Ti 0]);
[GrL GrM]=parallel(GrL,GrM,[Td*k 0],[T 1]);
[GotL GotM]=series(GrL,GrM,GoL,GoM);
[GzL GzM]=cloop(GotL,GotM,-1);

isstable=gstable(GzM);
if isstable==0
    %msgbox('Nie spełniony warunek konieczny kryterium Hurwitza')
elseif isstable==1
    %msgbox('Układ niestabilny lub na granicy stabilności')
else
    %msgbox('Układ stabilny')
end
