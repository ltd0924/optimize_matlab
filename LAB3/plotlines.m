function plotlines(x,y,ll,N,cor)
hold on;
scatter(x,y);
for i=1:N
    plot(ll{i}(1:2),ll{i}(3:4),cor);
end
hold off;
end