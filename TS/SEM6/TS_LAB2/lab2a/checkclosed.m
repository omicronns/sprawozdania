prepGo
Gc      = feedback(Go, 1);
poles   = roots(Gc.den{1});
stable  = true;

for pole = poles'
    if(real(pole) >= 0)
        stable = false;
    end
end
if(stable)
    fprintf('stable\n')
else
    fprintf('unstable\n')
end
