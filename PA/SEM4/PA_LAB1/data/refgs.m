clear Gdel, clear G6
[Gdel(1,:),Gdel(2,:)]=pade(tau,n);
G1=[0 k;T 1];
G2=[0 0 k; T1*T2 T1+T2 1];
G3=[0 0 k; T0*T0 2*E*T0 1];
G4=[0 0 k; Ti*T Ti 0];
G5=[Td 0; T 1];
[G6(1,:),G6(2,:)]=series(Gdel(1,:),Gdel(2,:),G1(1,:),G1(2,:));