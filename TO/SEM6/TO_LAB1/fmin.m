function [ x ] = fmin( fun, x0, x1 )
%FMIN   This function minimises single argument function fun
%       at [x0,x1] interval
    % Parameters:
    step = 0.001;
    
    % Body:
    valmin = fun(x0);
    xmin = x0;
    for arg=x0:step:x1
        val = fun(arg);
        if(valmin > val)
            valmin = val;
            xmin = arg;
        end
    end
    x = xmin;
end
