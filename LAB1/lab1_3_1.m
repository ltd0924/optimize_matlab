%save 'Exercise1_DataBase.mat' student;
load 'Exercise1_DataBase.mat'
% Q1: Add [Your Name, Your Age] to the list; Display the list
student=people(student,'insert',["Luotingdan",22]);
people(student,'list');
% Q2: Remove [“Tom”] from the list; Display the list
student=people(student,'remove','Tom');
people(student,'list');
% Q3: Add [“Joe”,24; “Ella”,28] to the list; Display the list
student=people(student,'insert',["Joe",24; "Ella",28]);
people(student,'list');
student=people(student,'reset');
people(student,'list');
% Q4: Reset the list; Display the list
% e.g. student = people(student,'reset'); people(student,'list');
     