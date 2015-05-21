function [ x ] = solve_fmin( fun, x0, x1 )
%FMIN   This function minimises single argument function fun
%       at [x0,x1] interval
    % Parameters:
    eps = 0.0001;
    
    % Body:
    gd = (sqrt(5) - 1)/2;
    while(abs(x0 - x1) > eps)
        xa = x1 - gd*(x1 - x0);
        xb = x0 + gd*(x1 - x0);
        if(fun(xa) < fun(xb))
            x1 = xb;
        else
            x0 = xa;
        end
    end
    x = (x0 + x1)/2;
end
