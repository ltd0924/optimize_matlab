function [x,ff]=Rosenbrock(x)
ff=0;
for i=1:length(x)-1
    ff=ff+(1-x(i))^2+100*(x(i+1)-x(i)^2)^2;
end