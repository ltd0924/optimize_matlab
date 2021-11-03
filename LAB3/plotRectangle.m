function h = plotRectangle(posVector)
X = posVector;
x = [X(1) X(1)+X(3) X(1)+X(3)  X(1)        X(1)];
y = [X(2) X(2)      X(2)+X(4)  X(2)+X(4)   X(2)];
h = plot(x,y,'black');
fill(x,y,'r')
end