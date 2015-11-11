function [ phi ] = calc_phi( u, y, n )
    phiy = zeros(length(y) - n,n);
    phiu = zeros(length(u) - n,n);
    for it=1:n
        phiy(:,n-it+1) = -y(it:length(y)-n+it-1);
        phiu(:,n-it+1) = u(it:length(u)-n+it-1);
    end
    phi = [phiy phiu];
end

