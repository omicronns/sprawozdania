function [ out ] = rbk( x )
%RBK    Rosenbrock function
    out = 0;
    for it=1:(length(x) - 1)
        out = out + (1 - x(it))^2 + 100*(x(it + 1) - x(it)^2)^2;
    end
end

