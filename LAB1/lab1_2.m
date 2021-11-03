clear all
x=0:0.02:0.8; % prepare X axis data
y=x;% prepare Y axis data
[CData.xi,CData.yi]=meshgrid(x,y); % prepare X, Y data for contour plot
for j=1:length(x)
  for k=1:length(y)
    CData.zi(j,k)=two_peaks([x(j),y(k)]); % prepare Z data for contour plot
  end
end
x0=[0.1 0.1]; % starting point
B.lb=[0 0]'; % lower bounds
B.ub=[0.8 0.8]'; % upper bounds
[x_opt,f_opt]=rnd_search('two_peaks',x0,B,CData,80,1e-5); % run optimization routine
fprintf('Final solution: %f %f\n',x_opt(1),x_opt(2));
disp(['Function value: ',num2str(f_opt)]);
%lab1_2
%Final solution: 0.499517 0.500079
%Function value: 0.00069247
