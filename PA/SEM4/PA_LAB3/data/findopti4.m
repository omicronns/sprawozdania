
precision1=0.01;
range1=0.9;
precision2=0.01;
range2=0.9;
precision3=0.01;
range3=0.9;

vtau=[tau-range1*tau:precision1*tau:tau+range1*tau];
vT1=[T1-range2*T1:precision2*T1:T1+range2*T1];
vT2=[T2-range3*T2:precision3*T2:T2+range3*T2];

tmpstep=rz2delstep(vtau(1),vT1(1),vT2(1),k,time,10);

err=sqerrcalc(resafil,tmpstep);

for n=1:length(vtau)
    for m=1:length(vT1)
        for k=1:length(vT2)
        tmpstep=rz2delstep(vtau(n),vT1(m),vT2(k),k,time,10);
        tmperr=sqerrcalc(tmpres,tmpstep);
        if tmperr < err
            err=tmperr;
            no=n;
            mo=m;
            ko=k;
        end
    end
    end
end

