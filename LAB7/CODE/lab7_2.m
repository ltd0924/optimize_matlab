%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (2) %
% Date:(2021.10.19) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
%Exercise 2: Random Search%
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
figure;
ff=@fp;
[xbest,fbest]=RDS(20,2,-2,2,ff);
figure;
ff=@fp;
[xbest,fbest]=RDS(20,1,-2,2,ff);
figure;
ff=@Rosenbrock;
[xbest,fbest]=RDS(20,2,-2,2,ff);
figure;
ff=@Auckley;
[xbest,fbest]=RDS(20,1,-10,10,ff);
figure;
ff=@Auckley;
[xbest,fbest]=RDS(20,2,-10,10,ff);
ff=@Auckley;
[xbest,fbest]=RDS(20,3,-10,10,ff)
figure;
ff=@fp;
[xbest,fbest]=SRDS(20,2,-2,2,ff,0.5);
figure;
ff=@fp;
[xbest,fbest]=SRDS(20,1,-2,2,ff,0.5);
figure;
ff=@Rosenbrock;
[xbest,fbest]=SRDS(20,2,-2,2,ff,0.5);
figure;
ff=@Auckley;
[xbest,fbest]=SRDS(20,1,-10,10,ff,0.5);
figure;
ff=@Auckley;
[xbest,fbest]=SRDS(20,2,-10,10,ff,0.5);
ff=@Auckley;
[xbest1,fbest1]=SRDS(20,3,-10,10,ff,0.5)