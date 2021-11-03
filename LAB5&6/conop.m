%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(6.2) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
function tt =conop(x1)
options=optimset('display','iter','TolX',1e-10,'TolFun',1e-10);
n=length(x1);
lb(1:n)=-Inf;
ub(1:n)=Inf;
tt =fmincon(@(x) cccp(x),x1,[],[],[],[],lb,ub,@(x) fcontr(x),options);
end
function f=cccp(x)
n=length(x);
t=x(1);
for i=2:n
    t=t+x(i)/i;
end
f=exp(t);
end

function [u,d]=fcontr(ct)
n=length(ct);
t=0;
for i=1:n
    t=t+ct(i)^2;
end
u=sqrt(t)-1;
d=[];
end
