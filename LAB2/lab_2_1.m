v1_1 = [-2, 2]';
v1_2 = [2, 1]';


v2_1 = [1,2,3,4]';
v2_2 = [2,3,4,1]';
v2_3 = [1,1,1,1]';

%[ans]=Orthonormal(v1_1,v1_2);
acc=Orthonormal(v2_1,v2_2,v2_3);
for i=1:length(acc)
    disp(acc{i})
end