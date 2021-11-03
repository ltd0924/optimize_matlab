function f = Rosenbrock(x)
n=size(x);f=0;
for i=1:n-1
    f=f+(1-x(i))^2+100*(x(i+1)-x(i)^2)^2;
end
end
