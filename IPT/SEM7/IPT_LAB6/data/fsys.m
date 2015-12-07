function [ dx ] = fsys( ~, x, omega0, a, xi )
    dx(1,1) = x(2);
    dx(2,1) = -omega0^2*sin(x(1) - a) - 2*xi*omega0*x(2);
end

