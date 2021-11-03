function [g,fbest]=DE(kmax,n,ll,hh,ff,N,F,CR)
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

for i=1:n
    x(i,:)=ll + (hh-ll)*rand(1,N);
end

for j=1:N
    [ut,ttc]=ff(x(:,j));
    fz(j)=ttc;
end
[~,I]=min(fz);
g=x(:,I);
while k < kmax
    for m=1:N
        y1=randi(N);
        while(y1==m)
            y1=randi(N);
        end
        y2=randi(N);
        while(y1==y2||y2==m)
            y2=randi(N);
        end
        y3=randi(N);
        while(y1==y3||y2==y3||y3==m)
            y3=randi(N);
        end
        p=randi(n);
        y=zeros(n,1);
        for i=1:n
            if p==i|| rand()<CR
                y(i)=x(i,y1)+F*(x(i,y2)-x(i,y3));
            else
                y(i)=x(i,m);
            end
            [~,ffy]=ff(y);[~,ffx]=ff(x(:,m));
            if ffy<ffx
                x(:,m)=y;
            end
        end
    end
    for i=1:N
        [~,ftm(i)]=ff(x(:,i));
    end    
    [~,I]=min(ftm);
    g=x(:,I);
    if n==2
    plot(g(1),g(2),'b*');
    end
    if n==1
        [~,uct]=ff(g);
    plot(g,uct,'b*');
    end
    k=k+1;  
end
if n==2
    plot(g(1),g(2),'ro','LineWidth',2);
end
if n==1
     [~,uct]=ff(g);
    plot(g,uct,'ro','LineWidth',2);
end
 [~,fbest]=ff(g);