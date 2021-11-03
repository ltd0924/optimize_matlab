function h = plotCircle(posVector)
t = 0:360;
theta = 2*pi/360 * t;
x = posVector(1)+posVector(3)*cos(theta);
y = posVector(2)+posVector(3)*sin(theta);
h = plot(x,y,'black');
fill(x,y,'r')
end