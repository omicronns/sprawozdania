
%precision1=1;
%range1=1;
precision2=0.005;
range2=0.95;

%vrank=[rank-range1*rank:precision1*rank:rank+range1*rank];
vrank=[1:20];
vT=[T-range2*T:precision2*T:T+range2*T];

tmpstep=strejcstep(vrank(1),vT(1),max(resafil),time);

err=sqerrcalc(resafil,tmpstep);

for n=1:length(vrank)
    for m=1:length(vT)
        tmpstep=strejcstep(vrank(n),vT(m),max(resafil),time);
        tmperr=sqerrcalc(resafil,tmpstep);
        if tmperr < err
            err=tmperr;
            no=n;
            mo=m;
        end
    end
end

