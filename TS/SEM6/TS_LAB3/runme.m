%% Równanie stanu sequ1, funkcjonał v11
[l, att, natt, nst, ndn] = checkLap2(8, @(x) true, @v11, @v11grad, @sequ1);
figure
axis([-8 8 -8 8])
hold on
if(~isempty(att))
    plot(att(:,1), att(:,2),'g.')
end
if(~isempty(natt))
    plot(natt(:,1), natt(:,2),'b.')
end
if(~isempty(nst))
    plot(nst(:,1), nst(:,2),'r.')
end
if(~isempty(ndn))
    plot(ndn(:,1), ndn(:,2),'c.')
end
for ii=1:5
    [tout yout] = ... 
        ode45(@(t, y) sequ1(y), [0 10], att(uint32(rand()*(length(att) - 1) + 1),:));
    plot(yout(:,1), yout(:,2), 'k-')
end

%% Równanie stanu sequ1, funkcjonał v12
[l, att, natt, nst, ndn] = ...
    checkLap2(8, @(x) x(1)*x(2) < 1, @v12, @v12grad, @sequ1);
figure
axis([-8 8 -8 8])
hold on
if(~isempty(att))
    plot(att(:,1), att(:,2),'g.')
end
if(~isempty(natt))
    plot(natt(:,1), natt(:,2),'b.')
end
if(~isempty(nst))
    plot(nst(:,1), nst(:,2),'r.')
end
if(~isempty(ndn))
    plot(ndn(:,1), ndn(:,2),'c.')
end
for ii=1:5
    [tout yout] = ... 
        ode45(@(t, y) sequ1(y), [0 10], att(uint32(rand()*(length(att) - 1) + 1),:));
    plot(yout(:,1), yout(:,2), 'k-')
end

%% Równanie stanu sequ2, funkcjonał v21
[l, att, natt, nst, ndn] = checkLap2(8, @(x) true, @v21, @v21grad, @sequ2);
figure
axis([-8 8 -8 8])
hold on
if(~isempty(att))
    plot(att(:,1), att(:,2),'g.')
end
if(~isempty(natt))
    plot(natt(:,1), natt(:,2),'b.')
end
if(~isempty(nst))
    plot(nst(:,1), nst(:,2),'r.')
end
if(~isempty(ndn))
    plot(ndn(:,1), ndn(:,2),'c.')
end
for ii=1:5
    [tout yout] = ... 
        ode45(@(t, y) sequ2(y), [0 10], natt(uint32(rand()*(length(natt) - 1) + 1),:));
    plot(yout(:,1), yout(:,2), 'k-')
end

