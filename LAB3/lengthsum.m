function lenth=lengthsum(Lines,N)
lenth=0;
for i=1:N
    lenth=lenth+sqrt((Lines{i}(1)-Lines{i}(2))^2+(Lines{i}(3)-Lines{i}(4))^2);
end
end