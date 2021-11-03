%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (1) %
% Date:(2021.10.28) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 1:Genetic Algorithms with Floating-Point Representation %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
figure;
fun=@fp;
[xbest,fbest]=fga(fun,10,-2,2,0.8,0.2,1,20,0.4)
figure;
fun=@fp;
[xbest,fbest]= fga(fun,10,-2,2,0.8,0.2,2,20,0.4)
figure;
fun=@Rosenbrock;
[xbest,fbest]= fga(fun,10,-2,2,0.8,0.2,2,20,0.4)
figure;
fun=@Auckley;
[xbest,fbest]= fga(fun,10,-10,10,0.8,0.2,1,20,0.4)
figure;
fun=@Auckley;
[xbest,fbest]= fga(fun,10,-10,10,0.8,0.2,2,20,0.4)
fun=@Auckley;
[xbest,fbest]= fga(fun,10,-10,10,0.8,0.2,3,20,0.4)


