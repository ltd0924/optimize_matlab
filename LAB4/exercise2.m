%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (4) %
% Date:(2021.9.27) %
% By: Luo Tingdan%
% %
% ID NUMBER: 12132638 %
% Exercise 2: Matlab Animation and Saving as Movies
% Create a moving vehicle in Matlab plot and save the animation to a mpg file.
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
%
syms x
figure
subplot(2,2,1);
f=@(x)x.^2;
dy=diff(f(x));
newton(f,dy,5,x);
subplot(2,2,2);
f=@(x)log(x);
dy=diff(f(x));
newton(f,dy,0.1,x);
subplot(2,2,3);
f=@(x)x.^4;
dy=diff(f(x));
newton(f,dy,5,x);
subplot(2,2,4);
f=@(x)x.^(1/2)-2;
dy=diff(f(x));
newton(f,dy,10,x);