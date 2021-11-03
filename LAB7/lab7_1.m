%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (1) %
% Date:(2021.10.19) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 1: Multiple-Run Gradient Search %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
figure;
ff=@fp;
[xbest,fbest]=RSGS(20,2,-2,2,ff)
figure;
ff=@fp;
[xbest,fbest]=RSGS(20,1,-2,2,ff)
figure;
ff=@Rosenbrock;
[xbest,fbest]=RSGS(20,2,-2,2,ff)
figure;
ff=@Auckley;
[xbest,fbest]=RSGS(20,1,-10,10,ff)
figure;
ff=@Auckley;
[xbest,fbest]=RSGS(20,2,-10,10,ff)
ff=@Auckley;
[xbest,fbest]=RSGS(20,3,-10,10,ff)