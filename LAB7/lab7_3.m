%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (1) %
% Date:(2021.10.19) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 3: Differential Evolution Algorithm %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
figure;
ff=@fp;
[xbest,fbest]=DE(20,2,-2,2,ff,10,1,0.5)
saveas(gcf, 'dfp2.jpg');
close all;
figure;
ff=@fp;
[xbest,fbest]=DE(20,1,-2,2,ff,10,1,0.5)
saveas(gcf, 'dfp1.jpg');
close all;
figure;
ff=@Rosenbrock;
[xbest,fbest]=DE(20,2,-2,2,ff,10,1,0.5)
saveas(gcf, 'dr.jpg');
close all;
figure;
ff=@Auckley;
[xbest,fbest]=DE(20,1,-10,10,ff,10,1,0.5)
saveas(gcf, 'da1.jpg');
close all;
figure;
ff=@Auckley;
[xbest,fbest]=DE(20,2,-10,10,ff,10,1,0.5)
saveas(gcf, 'da2.jpg');
close all;
ff=@Auckley;
[xbest,fbest]=DE(20,3,-10,10,ff,10,1,0.5)