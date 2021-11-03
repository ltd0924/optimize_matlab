theta=-pi:0.01:pi;
x=cos(theta); % "Heart Equation"
y=sin(theta)+((cos(theta)).^2).^(1/3); % "Heart Equation"
angle=mod(12132638,360)/180*pi;
x0=x*cos(angle)-y*sin(angle);
y0=x*sin(angle)+y*cos(angle);
plot(x,y,'r');
grid;
hold on
plot(x0,y0,'b');
grid;
hold on
