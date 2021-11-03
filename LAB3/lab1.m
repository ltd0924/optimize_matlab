%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
% Course: Nonlinear Optimization. %
% FALL.2021. Dr. Cheng. %
% Assignment: (3) %
% Date:(2021.9.18) %
% By: Luo Tingdan%
% %
% ID NUMBER: 12132638 %
% Exercise 1: Matlab Animation and Saving as Movies
% Create a moving vehicle in Matlab plot and save the animation to a mpg file.
% all inputs. %
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
%
close all
clear all
rect=[0,0,6,3];
cir1=[1,0,0.5];
cir2=[4.5,0,0.5];
figure
axis([0 20 0 20]);
F(1)=getframe(gcf);
for i=1:20
pause(0.2) %pause 0.2 second
rect(1) = rect(1) + i*0.01;
cir1(1) = cir1(1) + i*0.01;
cir2(1) = cir2(1) + i*0.01;
plotRectangle(rect);
hold on;
plotCircle(cir1);
plotCircle(cir2);
hold off;
F(i+1)=getframe(gcf); % save a frame
end
% save to a video file.
vidObj = VideoWriter('anim','MPEG-4');
vidObj.FrameRate=5;
open(vidObj)
for i=1:length(F)
% convert the image to a frame
frame = F(i) ;
writeVideo(vidObj, frame);
end
close(vidObj)
% Attach the parts above to a Word document and the results should be shown below.