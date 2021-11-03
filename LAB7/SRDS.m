function [xbest,fbest]=SRDS(kmax,n,ll,hh,ff,kb0)
fbest = Inf;
k = 0;

if n==1
    tt=linspace(ll,hh,100);
    for j=1:100
        [t,fc]=ff([tt(j)]);
        Y(j)=fc;
    end
    plot(tt,Y);
    hold on;
end
if n==2
    xx=linspace(ll,hh,100);yy=xx;
[X,Y] = meshgrid(xx,yy);
for i=1:100
    for j=1:100
        [t,fc]=ff([xx(i),yy(j)]);
        Z(i,j)=fc;
    end
end
contour(X,Y,Z);
hold on
end
Xnew=[];Fnew=[];
xbest = ll + (hh-ll)*rand(1,n);
[~,fbest] = ff(xbest);
k = 0;
kb=kb0;
while k < kmax
xnew = ll + (hh-ll)*rand(1,n);
xnew = kb*xnew + (1-kb)*xbest;
[xnew,fnew] = ff(xnew);
if n==1
    plot(xnew,fnew,'b*')
end
if n==2
    plot(xnew(:,1),xnew(:,2),'b*');
end
if fnew < fbest
xbest = xnew;
fbest = fnew;
end
kb = kb0*(1-k/kmax);
k = k + 1;
end
if n==2
    plot(xbest(1),xbest(2),'ro','LineWidth',2,'MarkerSize',12);
end
if n==1
    plot(xbest,fbest,'ro','LineWidth',2,'MarkerSize',12);
end