N = 120; % Number of selected nodes
coordinate = [];
for i = 1:N
    rng(i)
    temp = randi([1,20],2,1);
    coordinate = [coordinate, temp];
end
x = coordinate(1,:);
y = coordinate(2,:);
plot(x,y,'o','color','r')

hold on
[X,Y] = meshgrid(1:20,1:20);
plot(X,Y,'.','color','k','markersize',3)
xlim([0,21]); ylim([0,21]);                                                                                                                                                                                                                                                  
visited=zeros(20);
[x_a,y_a]=findpath(1,1,N,coordinate,visited);
[~,bb]=size(x_a);
 if bb==0
   disp("no path!");
 else
   plot(x_a,y_a,'*','color','b');
 end
