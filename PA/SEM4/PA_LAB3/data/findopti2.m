
precision=0.1;
range=0.1;

vtau=[tau-range*tau:precision*tau:tau+range*tau];
vT=[T-range*T:precision*T:T+range*T];

tmpstep=inerdelstep(vtau(1),vT(1),max(resafil),time);

err=sqerrcalc(resafil,tmpstep);

for n=1:length(vtau)
    for m=1:length(vT)
        tmpstep=inerdelstep(vtau(n),vT(m),max(resafil),time);
        tmperr=sqerrcalc(resafil,tmpstep);
        if tmperr < err
            err=tmperr;
            no=n;
            mo=m;
        end
    end
end

