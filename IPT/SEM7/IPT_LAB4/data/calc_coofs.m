function [ coofs ] = calc_coofs( u, y, n )
    phi = calc_phi(u,y,n);
    coofs = (phi'*phi)\(phi'*y(n+1:length(y)));
end
