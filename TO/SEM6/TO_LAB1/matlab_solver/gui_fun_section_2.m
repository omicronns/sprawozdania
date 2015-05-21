function [ out ] = gui_fun_section_2( ahandle, fun, x, x_idx, y, y_idx, static_arg )
%FUNSUB2 Plots section of function at given spaces indexes
%   Detailed explanation goes here

    z = zeros(length(x), length(y));
    for i=1:length(x)
        for j=1:length(y)
            static_arg(x_idx) = x(i);
            static_arg(y_idx) = y(j);
            z(j,i) = fun(static_arg);
        end
    end
    meshc(ahandle,x,y,z)
    xlabel('x');
    ylabel('y');
    out = ahandle;
end

