x=[0,2,2.8,4,5,6,7];
y=[0,-1,5,2,-1,5,8];
scatter(x,y,'DisplayName','Data points')
grid on;
p5=polyfit(x,y,5);
x1=linspace(0,7);
y1=polyval(p5,x1);
hold on;
plot(x1,y1,'b','DisplayName','Interpolation polynomial p')
q=polyder(p5);
y2=polyval(q,x1);
hold on;
plot(x1,y2,'r','DisplayName','First-order derivative of p')
plot([0,7],[0,0],'black','DisplayName','zero level')
syms x
pp=poly2sym(q);
ansp=real(double(solve(pp)));
scatter(ansp,polyval(p5,ansp),'*','DisplayName','Locations of local maxima/minima');