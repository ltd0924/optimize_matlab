%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (9) %
% Date:(2021.11.10) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 2:Random Sampling %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

n=2;
N=[20,50,100]
fun = @EVA;
%random sample
for j=1:3
    points=[];
    for i=1:N(j)
        points(i,:)=rand(n,1);
    end
    scatter(points(:,1),points(:,2))
    rs(j)=fun(points);
    saveas(gcf, strcat('rs',num2str(j),'.jpg'))
end
%stratified samples
N=[25,49,100]
for j=1:3
    points=SRS(N(j),n);
    scatter(points(:,1),points(:,2))
    srs(j)=fun(points);
    saveas(gcf, strcat('srs',num2str(j),'.jpg'))
end
