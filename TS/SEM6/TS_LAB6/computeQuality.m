function [ q ] = computeQuality( sys, T, U, P, I, D, type )
    timestep = 0.1;
    pidSys = tf(pid(P, I, D));
    serSys = series(pidSys, sys);
    errNum = serSys.den{1};
    errDen = sumPoly(serSys.num{1}, serSys.den{1});
    errSys = tf(errNum, errDen);
    [e t] = step(errSys, [0:timestep:T]);
    switch(type)
        case 'e2'
            q = sum(e.^2)*timestep;
        case 'te2'
            q = sum((e.^2).*t)*timestep;
        case 'abse'
            q = sum(abs(e))*timestep;
        case 'tabse'
            q = sum(abs(e).*t)*timestep;
    end
end

