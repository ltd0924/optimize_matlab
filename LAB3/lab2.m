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
Lines=genline(x,y,N);%generate lines
plotlines(x,y,reline,N,'r');%draw the initial status

waylen=lengthsum(Lines,N);%calculate the length
disp("current length "+ waylen);
cc=0;ft=0;tim=0;%cc current waylength ;ft:have cross or not; tim : iterations
while (waylen>cc||ft)&&tim<10000%Limit the number of iterations and search for local optimum
    reline=Lines;tim=tim+1;
    waylen=lengthsum(Lines,N);%calculate the current length
    for i=1:N
        for j=i:N
            if i~=j
                flag=crosscheck(Lines{i},Lines{j});%cross or not
            end
            if flag
                ft=1;
                ac=sqrt((Lines{i}(1)-Lines{j}(1))^2+(Lines{i}(3)-Lines{j}(3))^2);
                bd=sqrt((Lines{i}(2)-Lines{j}(2))^2+(Lines{i}(4)-Lines{j}(4))^2);
                ad=sqrt((Lines{i}(1)-Lines{j}(2))^2+(Lines{i}(3)-Lines{j}(4))^2);
                bc=sqrt((Lines{i}(2)-Lines{j}(1))^2+(Lines{i}(4)-Lines{j}(3))^2);
                if (ac+bd)>(ad+bc)%change the connection
                    tmp=Lines{i}(2);
                    Lines{i}(2)=Lines{j}(2);
                    Lines{j}(2)=tmp;
                    tmp=Lines{i}(4);
                    Lines{i}(4)=Lines{j}(4);
                    Lines{j}(4)=tmp;
                else%
                    Lines=genline(x,y,N);
                    if i==N
                        tmp=x(1);x(1)=x(j);x(j)=tmp;tmp=y(1);y(1)=y(j);y(j)=tmp;
                    else
                        tmp=x(i+1);x(i+1)=x(j);x(j)=tmp;tmp=y(i+1);y(i+1)=y(j);y(j)=tmp;
                    end
                    abc=genline(x,y,N);
                    ctmp=lengthsum(abc,N);
                    if ctmp<waylen%shorter->change the connection
                        Lines=abc;
                    end       
                end
                %plotlines(x,y,Lines,N,'r'); 
                %hold off;
            end
        end
    end
    cc=lengthsum(Lines,N);%calculate the current length
end
figure
plotlines(x,y,reline,N,'r');
disp("current length "+ waylen);

