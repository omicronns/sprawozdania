%Funkcjonał v1
[l, att, natt, nst, ndn] = checkLap2(8, @(x) true, @v1, @v1grad, @rs1);
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
for ii=1:10
    [tout yout] = ... 
        ode45(@(t, y) rs1(y), [0 10], att(uint32(rand()*length(att)),:));
    plot(yout(:,1), yout(:,2), 'k-')
end

%Funkcjonał v2
[l, att, natt, nst, ndn] = ...
    checkLap2(8, @(x) x(1)*x(2) < 1, @v2, @v2grad, @rs1);
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
for ii=1:10
    [tout yout] = ... 
        ode45(@(t, y) rs1(y), [0 10], att(uint32(rand()*length(att)),:));
    plot(yout(:,1), yout(:,2), 'k-')
end
