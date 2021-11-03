%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(6.1) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
fun=@Rosenbrock;
x1=zeros(3,1);
options = optimset('Display','iter','TolFun',1e-10,'PlotFcns',@optimplotfval);

c1=fminsearch(fun,x1,options);
x2=zeros(5,1);

c2=fminsearch(fun,x2,options);
x3=zeros(10,1);

c3=fminsearch(fun,x3,options);
