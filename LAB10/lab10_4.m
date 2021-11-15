%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (10) %
% Date:(2021.11.10) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 4:Optimization-Based Sampling Algorithm %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

fun=@EVA;
options = optimoptions('fmincon','Display','iter','PlotFcn','optimplotfval','MaxFunctionEvaluations',200000);
points=LHS(200,2);
n=length(points);

[xbest,fval]=fmincon(fun,points,[],[],[],[],zeros(200,2),1+zeros(200,2),[],options);
scatter(xbest(:,1),xbest(:,2))