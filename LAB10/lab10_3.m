%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (10) %
% Date:(2021.11.3) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 3:Latin Hypercube Sampling %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

n=[2,3];
N=[50,100,200];
for i=1:2
    for j=1:3
        points=LHS(N(j),n(i));
        if n(i)==2
            scatter(points(:,1),points(:,2))
        else
            scatter3(points(:,1),points(:,2),points(:,3))
        end
        lrs(i,j)=fun(points);
        saveas(gcf, strcat('lrs',num2str((i-1)*3+j),'.jpg'))
    end
end
