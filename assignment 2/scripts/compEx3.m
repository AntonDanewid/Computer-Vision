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





X = [Xmodel; ones(1,37)];






x1 = N1 * x{1};
x2 = N2 * x{2};
%bigX = N1*Xmodel;



figure;
plot (x1 (1 ,:) , x1 (2 ,:) , '. ', 'Markersize' ,20)
figure;
plot (x2 (1 ,:) , x2 (2 ,:) , '. ', 'Markersize' ,20)



P1 = dltsolve(X, x1);
P1 = N1\P1;
if any(P1(:,3)<0)
    P1 = - P1;
end
x1 = P1 * X;
x1 = pflat(x1);


P2 = dltsolve(X, x2);
P2 = N2\P2;
if any(P2(:,3)<0)
    P2 = - P2;
end
x2 = P2 * X;
x2 = pflat(x2);



figure; 


im = imread ('cube1.jpg');   
hold on;
imagesc ( im );


plot (x1(1 ,:) , x1 (2 ,:),'. ', 'Markersize' ,20);
hold off;

figure;
im2 = imread ('cube2.jpg');
hold on;
imagesc ( im2 );
plot (x2 (1 ,:) , x2 (2 ,:) , '. ' , 'MarkerSize', 20)

P1*X

figure;
hold on;
plot3([Xmodel(1,startind);Xmodel(1,endind)],...
[Xmodel(2,startind);Xmodel(2,endind)],...
[Xmodel(3,startind);Xmodel(3,endind)] , 'b -' );
P1pos = pflat(null(P1));
p1dir=P1(3 ,1:3)/norm( P1(3 ,1:3));

P2pos = pflat(null(P2));
p2dir=P2(3 ,1:3)/norm( P2(3 ,1:3));


plot3 (P1pos (1 ,:) ,P1pos (2 ,:) , P1pos (3 ,:) , '. ', 'Markersize',20);
quiver3 (P1pos(1) , P1pos(2) , P1pos(3) , p1dir(1) , p1dir(2) , p1dir(3) , 5);
plot3 (P2pos (1 ,:) ,P2pos (2 ,:) , P2pos (3 ,:) , '. ', 'Markersize',20);

quiver3 (P2pos(1) , P2pos(2) , P2pos(3) , p2dir(1) , p2dir(2) , p2dir(3) , 5); 



hold off;

P1inner = rq(P1);
P2inner = rq(P2);

P1inner = P1inner./P1inner(3, 3)
P2inner = P2inner./P2inner(3, 3)



