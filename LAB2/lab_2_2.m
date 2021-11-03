f = @(x,y) x.^2 + y.^2;
[xx,yy] = meshgrid(-2:0.25:2);
[fx,fy] = gradient(f(xx,yy),0.25);
x0=0.5;y0=-0.5;
t = (xx == x0) & (yy == y0);
indt = find(t);
fx0 = fx(indt);
fy0 = fy(indt);
z = @(x,y) f(x0,y0) + fx0*(x-x0) + fy0*(y-y0);%切平面
surf(xx,yy,f(xx,yy),'EdgeAlpha',0.7,'FaceAlpha',0.9)
hold on
surf(xx,yy,z(xx,yy))
plot3(x0,y0,f(x0,y0),'r*')