clear
close all;
load('compEx3data.mat');

std1 = std (x {1 }(1:2 ,:) ,0 ,2);

s1 = (std1(1) + std1(end))/2;
s1 = 1 /s1;

x1mean = mean (x {1 }(1:2 ,:) ,2);
x2mean = mean (x {2 }(1:2 ,:) ,2);

std2 = std (x {2 }(1:2 ,:) ,0 ,2);

s2 = (std2(1) + std2(end))/2;
s2 = 1 /s2;




N1 = [s1, 0, -s1*x1mean(1); 0 s1 -s1*x1mean(2); 0 0 1];
N2 = [s2, 0, -s2(1)*x2mean(1); 0 s2 -s2*x2mean(2); 0 0 1];


x1 = N1 * x{1};
x2 = N2 * x{2};
figure;
plot (x1 (1 ,:) , x1 (2 ,:) , '. ', 'Markersize' ,20)
figure;
plot (x2 (1 ,:) , x2 (2 ,:) , '. ', 'Markersize' ,20)


P1 = dlt(Xmodel, x1);
P2 = dlt(Xmodel, x2);




figure; 


im = imread ('cube1.jpg');
hold on;
imagesc ( im );

x1 = P1*Xmodel;
x1 = N1*x1;
plot (x1 (1 ,:) , x1 (2 ,:),'. ', 'Markersize' ,20);
hold off;

figure;
im2 = imread ('cube2.jpg');
hold on;
imagesc ( im2 );
xx = P2*Xmodel;
plot (xx (1 ,:) , xx (2 ,:) , '. ' , 'MarkerSize', 20)







