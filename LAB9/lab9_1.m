%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (9) %
% Date:(2021.11.3) %
% By: LuoTingdan %
% %
% ID NUMBER: (12132638） %
% Exercise 1: Multiobjective Using Genetic Algorithm %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

fft=@ft;
fff=@ff;
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto);
[x,fval,exitflag,output]  = gamultiobj(fft,3,[],[],[],[],[0.5,-2,-2],[1,2,2],options);
lb(1:8)=-2;
ub(1:8)=2;
saveas(gcf, 'fft.jpg')
[x1,fval1,exitflag1,output1]  = gamultiobj(fff,8,[],[],[],[],lb,ub,options);
saveas(gcf, 'fff.jpg')
