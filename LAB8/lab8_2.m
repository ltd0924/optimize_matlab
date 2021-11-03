%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (1) %
% Date:(2021.10.28) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 2:Evolutionary Algorithm for TSP %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
for i=1:10
    dis{i}=rand(1,10)*100;
end
[xbest,fbest]=tsp(dis,20,10,0.8,0.2,200,0.4);
[xbest,fbest]=tsp(dis,100,10,0.8,0.2,200,0.4);
[xbest,fbest]=tsp(dis,200,10,0.8,0.2,200,0.4);
[xbest,fbest]=tsp(dis,500,10,0.8,0.2,200,0.4);