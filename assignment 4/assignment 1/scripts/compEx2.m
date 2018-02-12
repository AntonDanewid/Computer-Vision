clear;
load('compEx2.mat');
im = imread ('compEx2.JPG');
imagesc(im);
colormap gray
hold on; 



tp1= transpose(p1);
plot (p1 (1 ,:) , p1 (2 ,:) , '. ' , 'MarkerSize', 20)
hold on; 
plot (p2 (1 ,:) , p2 (2 ,:) , '. ' , 'MarkerSize', 20)
hold on; 
plot (p3 (1 ,:) , p3 (2 ,:) , '. ', 'MarkerSize', 20)
hold on; 
line1 = null(transpose(p1));
rital(line1);
hold on;
line2 = null(transpose(p2));
rital(line2);
hold on;
line3 = null(transpose(p3));
rital(line3);
hold on;

%Intersection for line 2 and 3
m = [line2, line3];
m = transpose(m);
disp('The nullspace/ line of intersection for line 2 and 3 is')
m = null(m)
disp('Normalized')
m = pflat(m)





hold on;
plot (m (1 ,:) , m (2 ,:) , '.', 'MarkerSize', 20)
disp('The distance from the intersection point to line 1 is');
d= abs(line1(1)*m(1) + line1(2)*m(2) + line1(3)) / sqrt(line1(1)^2 + line1(2)^2)

