%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(6.3) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
x=[1 2 3 4 5 6 7 8 9 10];
y=[2.3743 1.1497 0.7317 0.5556 0.4675 0.4157 0.3807 0.3546 0.3337 0.3164]; 

fun=@(t) t(1)*exp(-t(2)*x)+t(3)*exp(-t(4)*x)-y;
x0=[1,1,1,1];
options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective');
xx = lsqnonlin(fun,x0,[],[],options)
scatter(x,y,'*');
grid on;
hold on;
scatter(x,fun(x0),'filled');
scatter(x,fun(xx),'o');