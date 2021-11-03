%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(5.1) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
fun=@(x) 2*x(1)^2+3*x(2)^2-3*x(1)*x(2)+ x(1);
x0=[5;8];
lab66(fun,-2,8,x0);

fun=@(x) (1-x(1))^2+5*(x(1)-x(2)^2)^2;
x0=[0;0];
lab66(fun,-0.5,1.5,x0);

fun=@(x) (x(1)+2*x(2))*(1-0.9*exp(-0.3*(x(1)-2.5)^2-2*(x(2)-3.5)^2))*(1-0.9*exp(-(x(1)-3)^2-(x(2)-3)^2));
x0=[4;2];
lab66(fun,1,5,x0);

fun=@(x) exp(x(1)/5)+exp(x(2)/3);
x0=[5 8];
lab66(fun,-10,10,x0);
