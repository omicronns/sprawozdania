%gradient
[w J]=eig(A);
W=(w./[max(abs(w));max(abs(w))])*10;
[x y] = meshgrid([-10:1:10],[-10:1:10]);
dx = [A(1,1)*x + A(1,2)*y];     %x'=Ax
dy = [A(2,1)*x + A(2,2)*y];     %x'=Ax
figure; hold on; grid on;
quiver(x,y,dx,dy);
if isreal(W)
    plot([-W(1,1) W(1,1)],[-W(2,1) W(2,1)],'k-');
    plot([-W(1,2) W(1,2)],[-W(2,2) W(2,2)],'k-');
end

%przyk³adowe trajektorie
T=6;
a=[0:(pi/5):(2*pi)];
X1=[cos(a);sin(a)];
X2=(X1./[max(abs(X1));max(abs(X1))])*10;
for l=[1:length(a)]
    x0=X2(:,l);
    sim('portret', T);
    plot(x(:,1),x(:,2),'k-');
end

%opis
axis([-10 10 -10 10]);
xlabel('x1');
ylabel('x2');