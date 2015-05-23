function [ out ] = rbkgrad( x )
%RBKGRAD Gradient of rbk function(computed analytically)
    out = zeros(size(x));
    out(1) = -2*(1 - x(1)) - 400*x(1)*(x(2) - x(1)^2);
    out(length(x)) = 200*(x(length(x)) - x(length(x) - 1)^2);
    if(length(x) > 2)
        for i=2:(length(x) - 1)
            out(i) = 200*(x(i) - x(i - 1)^2)    -  ...
                     2*(1 - x(i))               -  ...
                     400*x(i)*(x(i + 1) - x(i)^2);
        end
    end
end
