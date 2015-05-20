%% Prepare systems

sys(1)=tf([5,0],[1,1]);
sys(2)=tf([5],[1,1,10]);
sys(3)=zpk([],-3*ones(10,1),[5]);
U = 5;
T = 10;

%% Parameters search

for it=1:3
    Ke2(:,it) = findParams(sys(it), [0 100], 'e2');
    Qe2(it) = computeQuality(sys(it), T, U, Ke2(1,it), Ke2(2,it), Ke2(3,it), 'e2');
    Kte2(:,it) = findParams(sys(it), [0 100], 'te2');
    Qte2(it) = computeQuality(sys(it), T, U, Kte2(1,it), Kte2(2,it), Kte2(3,it), 'te2');
    Kabse(:,it) = findParams(sys(it), [0 100], 'abse');
    Qabse(it) = computeQuality(sys(it), T, U, Kabse(1,it), Kabse(2,it), Kabse(3,it), 'abse');
end

%% Robustness check

for it=1:3
    pidSyse2 = tf(pid(Ke2(1,it), Ke2(2,it), Ke2(3,it)));
    serSyse2 = series(pidSyse2, modifySys(sys(it)));
    loopSyse2 = feedback(serSyse2, 1);
    figure
    nyquist(loopSyse2)
    
    pidSyste2 = tf(pid(Kte2(1,it), Kte2(2,it), Kte2(3,it)));
    serSyste2 = series(pidSyste2, modifySys(sys(it)));
    loopSyste2 = feedback(serSyste2, 1);
    figure
    nyquist(loopSyste2)
    
    pidSysabse = tf(pid(Kabse(1,it), Kabse(2,it), Kabse(3,it)));
    serSysabse = series(pidSysabse, modifySys(sys(it)));
    loopSysabse = feedback(serSysabse, 1);
    figure
    nyquist(loopSysabse)
end

