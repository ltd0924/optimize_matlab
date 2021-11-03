function [x,ff]=Auckley(x)
cc=0;bb=0;
n=length(x);
for i=1:n
    cc=cc+x(i)^2;
    bb=bb+cos(2*pi*x(i));
end
ff=-20*exp(-0.2*sqrt(cc/n))-exp(bb/n)+21;
end