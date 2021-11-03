function [x,ff]=fp(x)
ct=norm(x,2);
ff=-exp(-0.5*ct^2);
for i=1:length(x)
    ff=ff*cos(10*x(i));
end