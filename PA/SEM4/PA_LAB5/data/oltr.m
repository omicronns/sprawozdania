function [GotL GotM] = oltr(k,Ti,Td)
T=0.01;
GoL=[10];
GoM=[1 2 2 1];

[GrL GrM]=parallel([k],[1],[k],[Ti 0]);
[GrL GrM]=parallel(GrL,GrM,[Td*k 0],[T 1]);
[GotL GotM]=series(GrL,GrM,GoL,GoM);
