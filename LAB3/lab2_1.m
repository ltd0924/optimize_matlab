%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (3) %
% Date:(2021.9.18) %
% By: Luo Tingdan%
% %
% ID NUMBER: 12132638 %
% Exercise 2: Travelling Salesman Problem
% There are N cities with the distance between city i and city j given by dij. Problem:
% find a close route through all the cities so that minimizes the total route length.
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
%   
N=40;
X=100;Y=100;
for i=1:40
    x(i)=round(X*rand());
    y(i)=round(Y*rand());
end


for i=1:N-1
    Lines{i}=[x(i:i+1),y(i:i+1)];
end
Lines{N}=[[x(N),x(1)],[y(N),y(1)]];
plotlines(x,y,Lines,N,'black');

cc=1;
while cc==1
    cc=0;
for i=1:N
        for j=1:N
            if i~=j
                flag=crosscheck(Lines{i},Lines{j});
            end
            if flag
                cc=1;
                ac=sqrt((Lines{i}(1)-Lines{j}(1))^2+(Lines{i}(3)-Lines{j}(3))^2);
                bd=sqrt((Lines{i}(2)-Lines{j}(2))^2+(Lines{i}(4)-Lines{j}(4))^2);
                ad=sqrt((Lines{i}(1)-Lines{j}(2))^2+(Lines{i}(3)-Lines{j}(4))^2);
                bc=sqrt((Lines{i}(2)-Lines{j}(1))^2+(Lines{i}(4)-Lines{j}(3))^2);
                if (ac+bd)>(ad+bc)
                    tmp=Lines{i}(2);
                    Lines{i}(2)=Lines{j}(2);
                    Lines{j}(2)=tmp;
                    tmp=Lines{i}(4);
                    Lines{i}(4)=Lines{j}(4);
                    Lines{j}(4)=tmp;
                else
                    tmp=Lines{i}(2);
                    Lines{i}(2)=Lines{j}(1);
                    Lines{j}(1)=tmp;
                    tmp=Lines{i}(4);
                    Lines{i}(4)=Lines{j}(3);
                    Lines{j}(3)=tmp;
                end
            end
        end 
    
end
end
plotlines(x,y,Lines,N,'r');            
