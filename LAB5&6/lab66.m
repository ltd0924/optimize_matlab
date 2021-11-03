%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (5) %
% Date:(2021.10.14) %
% By:LuoTingdan %
% %
% ID NUMBER: 12132638 %
% LAB:(5.1) %
% Description:  %
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
function lab66(funn,xl,xh,x0)
x=xl:0.2:xh; % prepare X axis data
y=x;% prepare Y axis data
[CData.xi,CData.yi]=meshgrid(x,y); % prepare X, Y data for contour plot
for j=1:length(x)
  for k=1:length(y)
    CData.zi(j,k)=funn([x(j),y(k)]); % prepare Z data for contour plot
  end
end
B.lb=[xl xl]'; % lower bounds
B.ub=[xh xh]'; % upper bounds
[x_opt,f_opt]=rnd_search('funn',x0,B,CData,80,1e-5); % run optimization routine
fprintf('Final solution: %f %f\n',x_opt(1),x_opt(2));
disp(['Function value: ',num2str(f_opt)]);

end