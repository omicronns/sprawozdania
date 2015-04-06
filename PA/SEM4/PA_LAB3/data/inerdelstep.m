function [stepresp] = inerdelstep(tau,T,k,time,n)
    if nargin < 5
        n = 10;
    end

[Gd(1,:) Gd(2,:)]=pade(tau,n);
[Gm(1,:) Gm(2,:)]=series(Gd(1,:),Gd(2,:),[0 k],[T 1]);

stepresp=step(Gm(1,:),Gm(2,:),time)';

end

