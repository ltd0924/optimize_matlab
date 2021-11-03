%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (9) %
% Date:(2021.11.3) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 2:Multiobjective Evolutionary Algorithm %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%


fft=@ft;
fff=@ff;
lb(1:8)=-2;
ub(1:8)=2;

ac=mec(fft,100,[0.5,-2,-2],[1,2,2],0.8,0.3,3,0.4,200);
saveas(gcf, 'fft2.jpg')

ac=mec(fff,100,lb,ub,0.7,0.1,8,0.4,200);
saveas(gcf, 'fff2.jpg')
