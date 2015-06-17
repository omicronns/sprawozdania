function [ xk1 ] = solve_minimstep( xk, fun, fungrad )
%MINIMSTEP  This function evaluates one step of steepest descent
%           optimization method.
%
%           xk      - start point
%           fun     - function to be minimised
%                       (should take one vector argument)
%           fungrad - function that returns gradient vector of fun
    % Parameters:
    maxstep = 0.1;

    % Body:
    dir = fungrad(xk);
    dir = dir/norm(dir);
    funmin = @(alpha) fun(xk - alpha*dir);
    alpha = solve_fmin(funmin, 0, maxstep);
    xk1 = xk - alpha*dir;
end
