%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (4) %
% Date:(2021.9.27) %
% By: Luo Tingdan%
% %
% ID NUMBER: 12132638 %
% Exercise 1: Golden Ratio Search
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
%
figure
subplot(2,1,1);
f=@(x)(x-2).^2;
golden_ratio_search(f,0,10);
subplot(2,1,2);
g=@(x)x.^2+3*exp(-2*x);
golden_ratio_search(g,0,10);