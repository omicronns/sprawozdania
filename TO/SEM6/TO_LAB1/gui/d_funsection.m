function [ out ] = funsection( fun, x, x_idx, static_x )
%FUNSECTION This function plots section of multiargument function fun
%           with loose variable at x_idx, constant variables
%           given by static_x, and variable argument vector x

    y = zeros(1, length(x));
    for i=1:length(x)
        static_x(x_idx) = x(i);
        y(i) = fun(static_x);
    end
    plot(x, y)
    grid on
    xlabel('x');
    ylabel('y');
end
