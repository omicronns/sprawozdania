function [ errs ] = fgoal( odefun, t, y, x0)
    [ts xs] = ode45(odefun,t,x0);
    errs = xs(:,1) - y;
end

