function ac=ff(x)
c=0;
for i=1:8
    c=c+(x(i)-1/sqrt(8))^2;
end
f1=1-exp(-c);
for i=1:8
    c=c+(x(i)+1/sqrt(8))^2;
end
f2=1-exp(-c);
ac=[f1;f2];
end