function [x,f]=rnd_search(fun,x,B,CData,max_iter,tol_x)
X{1}=x; % cell array storing all accepted solutions
f=feval(fun,x); % evaluate function
range=0.2*norm(B.ub-B.lb); % set current search range
count=1; % reset iteration counter
while count<max_iter& norm(range)>=tol_x% check termination condition
  step=(B.ub-B.lb).*(rand(2,1)-0.5)*range; % calculate search step
  x_new=max(min(x+step,B.ub),B.lb); % calculate new solution
  f_new=feval(fun,x_new); % evaluate function at new solution
  rnd_plot(CData,X,x,2,x_new); % plot data
  if f_new<f % new solution accepted
    range=range*2.0; % increase search range
    x=x_new; f=f_new;
    X{length(X)+1}=x;
    rnd_plot(CData,X,x,1);
  else % new solution rejected
    range=range/1.3; % decrease search range
  end
  count=count+1; % update iteration counter
end
rnd_plot(CData,X,x,3); % plot final data
