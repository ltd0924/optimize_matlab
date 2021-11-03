function [g,fbest]=PSO(kmax,n,ll,hh,ff,N,c,c1,c2)
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
for i=1:n
    x(i,:)=ll + (hh-ll)*rand(1,N);
    v(i,:)=rand(1,N);
end
xbest=x;
g=zeros(n,1);
for j=1:N
    [ut,ttc]=ff(x(:,j));
    fz(j)=ttc;
end
[~,I]=min(fz);
g=x(:,I);
while k < kmax
    for i=1:N
        r1=rand(1);
        r2=rand(1);
        v(:,i)=c*(v(:,i)+c1*r1*(xbest(:,i)-x(:,i))+c2*r2*(g-x(:,i)));
        x(:,i)=x(:,i)+v(:,i);
        [~,ffi]= ff(x(:,i)); [~,ffb]= ff(xbest(:,i)); [~,ffg]= ff(g);
        if ffi<ffb
            xbest(:,i)=x(:,i);
        end
        if ffi<ffg
            g=x(:,i);
        end
    end
    for i=1:N
        for row=1:n
            if x(row,i)>hh
                x(row,i)=hh;
            elseif x(row,i)<ll
                x(row,i)=ll;
            else
            end
        end
    end

    if n==2
    plot(g(1),g(2),'*');
    end
    if n==1
        [~,uct]=ff(g);
    plot(g,uct,'*');
    end
    k=k+1;  
end
if n==2
    plot(g(1),g(2),'ro','LineWidth',2,'MarkerSize',12);
end
if n==1
     [~,uct]=ff(g);
    plot(g,uct,'ro','LineWidth',2,'MarkerSize',12);
end
 [~,fbest]=ff(g);