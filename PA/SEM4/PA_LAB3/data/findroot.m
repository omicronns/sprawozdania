function [ridx] = findroot(vals)

m=1;
for n=1:length(vals)-1
    if vals(n)*vals(n+1) < 0
        ridx(m)=n;
        m=m+1;
    end
end

end

