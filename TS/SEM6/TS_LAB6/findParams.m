function [ K ] = findParams( sys, con, errtype )
    U = 5;
    T = 10;
    minfun = @(K) computeQuality(   sys, ...
                                    T,      ...
                                    U,      ...
                                    conParam(K(1), con),     ...
                                    conParam(K(2), con),     ...
                                    conParam(K(3), con),     ...
                                    errtype);
    K = fminsearch(minfun, [0;0;0]);
    K(1) = conParam(K(1), con);
    K(2) = conParam(K(2), con);
    K(3) = conParam(K(3), con);
end
