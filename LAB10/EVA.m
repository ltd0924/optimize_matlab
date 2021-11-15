%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (10) %
% Date:(2021.11.10) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 1:Design of Experimentss %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

function e=EVA(x)
N=length(x);
e=0;
for i=1:N
    for j=i+1:N
        e=e+1/((norm(x(i,:)-x(j,:)))^2);
    end
end