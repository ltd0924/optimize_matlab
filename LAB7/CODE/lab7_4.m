%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (1) %
% Date:(2021.10.19) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 4: Particle Swarm Optimization %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
figure;
ff=@fp;
[xbest,fbest]=PSO(20,2,-2,2,ff,10,0.5,2,2)
saveas(gcf, 'pfp2.jpg');
close all;
figure;
ff=@fp;
[xbest,fbest]=PSO(20,1,-2,2,ff,10,0.9,2,2)
saveas(gcf, 'pfp1.jpg');
close all;
figure;
ff=@Rosenbrock;
[xbest,fbest]=PSO(20,2,-2,2,ff,10,0.7298,1,2)
saveas(gcf, 'pr.jpg');
close all;
figure;
ff=@Auckley;
[xbest,fbest]=PSO(20,1,-10,10,ff,10,0.7298,2,1)
saveas(gcf, 'pa1.jpg');
close all;
figure;
ff=@Auckley;
[xbest,fbest]=PSO(20,2,-10,10,ff,10,0.7298,2,3)
saveas(gcf, 'pa2.jpg');
close all;
ff=@Auckley;
[xbest,fbest]=PSO(2000,3,-10,10,ff,100,0.7298,3,2)