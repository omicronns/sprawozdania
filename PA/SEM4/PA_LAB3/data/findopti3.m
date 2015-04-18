
precision=0.01;
range=0.5;

vtau=[tau-range*tau:precision*tau:tau+range*tau];

tmpstep=rz2delstep(vtau(1),T1,T2,k,time,10);

err=sqerrcalc(tmpres,tmpstep);

for n=1:length(vtau)
    tmpstep=rz2delstep(vtau(n),T1,T2,k,time,10);
    tmperr=sqerrcalc(tmpres,tmpstep);
    if tmperr < err
        err=tmperr;
        no=n;
        mo=m;
    end
end

