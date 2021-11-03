%----------------------------------- Lab 1 --------------------------------
% Due on Sakai on 11:55pm, September 12, 2021

%% Exercise 1£º Operations - Simple Database
student(1).name = 'Jack';
student(1).age = 18;
student(2).name = 'Amy';
student(2).age = 20;
student(3).name = 'Tom';
student(3).age = 21;
student(4).name = 'Michael';
student(4).age = 17;
student(5).name = 'Linda';
student(5).age = 18;
student(6).name = 'Ryan';
student(6).age = 19;
student(7).name = 'Jimmy';
student(7).age = 18;
student(8).name = 'Betty';
student(8).age = 20;
student(9).name = 'Brook';
student(9).age = 21;
student(10).name = 'Alan';
student(10).age = 23;
% save 'Exercise1_DataBase.mat' student;
% load 'Exercise1_DataBase.mat'

% Q1: Add [Your Name, Your Age] to the list; Display the list

% Q2: Remove [¡°Tom¡±] from the list; Display the list

% Q3: Add [¡°Joe¡±,24; ¡°Ella¡±,28] to the list; Display the list

% Q4: Reset the list; Display the list
% e.g. student = people(student,'reset'); people(student,'list');
       

%% Exercise 2£º Rotating Polygon

theta=-pi:0.01:pi;
x=cos(theta); % "Heart Equation"
y=sin(theta)+((cos(theta)).^2).^(1/3); % "Heart Equation"
plot(x,y,'r');
grid;
hold on

% Q1: Rotate the given polygon with respect to coordinate axis origin in CLOCKWISE direction
%     Rotation angle is calculated using the following formula: mod([Your ID number],360)




%% Exercise 3£º Rotating Polygon
% Obstacle Maps Generation
N = 80; % Number of selected nodes
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
xlim([0,21]); ylim([0,21]);

% Q1: Test your code under three cases: N = 40, N = 80 and N = 120



