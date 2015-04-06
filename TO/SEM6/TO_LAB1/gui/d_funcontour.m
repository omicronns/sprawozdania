function [ out ] = funcontour( ahandle, fun, x, y )
%FUNCONTOUR This function opens new figure window
%           and plots contourplot of fun at given area.
%           fun should take one argument: 1x2 vector
    
    z = zeros(length(x), length(y));
    for i=1:length(x)
        for j=1:length(y)
            z(j,i)=fun([x(i),y(j)]);
        end
    end
    contour(ahandle,x,y,z)
    xlabel('x');
    ylabel('y');
    out = ahandle;
end
