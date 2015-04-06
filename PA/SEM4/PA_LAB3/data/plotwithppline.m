function [T0,Tk,tpp] = plotwithppline(time,samples,surr)

maxval=max(samples);
maxline=ones(1,length(samples))*maxval;
%zeroline=zeros(1,length(samples));

xpp=findpp(samples,surr);
ypp=samples(xpp);
dpp=(samples(xpp+1)-samples(xpp-1))/2;
ppline=linecrt(xpp,ypp,dpp,length(samples));

hold off
plot(time,samples,time,maxline,'--r',time,ppline,'--k');%,time,zeroline,'--b');
axis([time(1) time(length(time)) 0 maxval+0.05*maxval])
hold on

T0=time(findroot(ppline))-time(1);
Tk=time(findroot(ppline-maxline))-time(1);
tpp=time(xpp)-time(1);

plot(T0,0,'o','MarkerSize',5,'MarkerFaceColor','k')
text(T0+4,0+0.02,'A')
plot(Tk,maxval,'o','MarkerSize',5,'MarkerFaceColor','k')
text(Tk+3,maxval-0.04,'B')
plot(tpp,ypp,'o','MarkerSize',5,'MarkerFaceColor','k')
text(tpp+3,ypp-0.04,'PP')

end

