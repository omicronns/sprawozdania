function [ amp, phase ] = simNyq( sys, omega )
    period=2*pi/omega;
    t=linspace(0,period*(10+floor(omega)),10000);
    u=sin(t*omega);
    ust=u(5000:length(u));
    tstu=t(5000:length(t));
    [y,t]=lsim(sys,u,t);
    yst=y(5000:length(y));
    tsty=t(5000:length(t));
    i1=1;
    while(~(ust(i1) < 0 && ust(i1+1) > 0))
        i1 = i1 + 1;
    end
    i2=i1;
    while(~(yst(i2) < 0 && yst(i2+1) > 0))
        i2 = i2 + 1;
    end
    ptime=abs(tstu(i1)-tsty(i2));
    phase=2*pi*ptime/period;
    amp=max(yst);
end

