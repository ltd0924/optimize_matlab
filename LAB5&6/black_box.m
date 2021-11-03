%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(6.4) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
function [f,x1,y1,f1]=black_box(n)
x1([1:n],1)=1/n
yy=zeros(n,1);
Aeq([1:n])=1
options = optimset('Display','iter','TolX',1e-8,'TolFun',1e-8);
f=fminimax(@black_boxf,x1,[],[],Aeq,[1],yy,[],[],options);
y1=black_boxf(x1);
f1=black_boxf(f);
end


function R=black_boxf(x)
c=1;
for j=1:length(x)
    R(j)=x(j)/j+c*x(j)^2/sqrt(j);
end
end