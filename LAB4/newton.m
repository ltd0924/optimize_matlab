%newton's method
function newton(f,dy,x0,x)
cmin=10^(-8);
ezplot(f);
hold on;
c=0;
while abs(f(x0))>cmin
    dc=subs(dy,x,x0);
    c=c+1;
    x1=x0-f(x0)/dc;
    plot([x0,x1,x1],[f(x0),0,f(x1)],'r');
    x0=x1;
end
fprintf('Iteration %d:x=%f f=%f\n', c,x0,f(x0));
