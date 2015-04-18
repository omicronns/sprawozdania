function [stepresp] = rz2delstep(tau,T1,T2,k,time,n)
    if nargin < 6
        n = 10;
    end

[Gd(1,:) Gd(2,:)]=pade(tau,n);
[Gm(1,:) Gm(2,:)]=series(Gd(1,:),Gd(2,:),[0 0 k],[T1*T2 T1+T2 1]);

stepresp=step(Gm(1,:),Gm(2,:),time)';

end

