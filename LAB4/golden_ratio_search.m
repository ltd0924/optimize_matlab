%golden ratio search
function golden_ratio_search(f,x1,x2)
t=(1+5^(1/2))/2;
cmin=10^(-3);
ezplot(f);
hold on;
while abs(x1-x2)>cmin
      
    plot(x1,f(x1),'*');
    plot(x2,f(x2),'*');
    x3=x2-(x2-x1)/t;
    x4=x1+(x2-x1)/t;
    if f(x3)>f(x4)
        x1=x3;
    else
        x2=x4;
    end
end
