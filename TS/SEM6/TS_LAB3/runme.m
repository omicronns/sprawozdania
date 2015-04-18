[ok, l, att, natt, nst] = checkLap2(8, @v1, @v1grad, @rs1);
figure
plot(att(:,1), att(:,2),'g.', natt(:,1), natt(:,2),'b.', nst(:,1), nst(:,2),'r.')
axis([-8 8 -8 8])
hold on
for ii=1:10
    [tout yout] = ode45(@(t, y) rs1(y), [0 10], att(uint32(rand()*length(att)),:));
    plot(yout(:,1), yout(:,2), 'k-')
end

