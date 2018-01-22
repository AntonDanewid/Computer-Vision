P= [ 1 0 0 0; 0 1 0 0; 0 0 1 1];
X1 = [3;2;1;1];
X2 = [-1;-1;1;1];
X3 = [1;1;-1;1];
pflat(P*X1)
pflat(P*X2)
pflat(P*X3)



load('compEx4.mat');
im1 = imread ('compEx4im1.JPG');
im2 = imread ('compEx4im2.JPG');
Uf = pflat(U);



P1pos = pflat(null(P1)); 
p1dir =P1(3 ,1:3);
P2pos = pflat(null(P2)); 
p2dir =P2(3 ,1:3);


plot3 (Uf (1 ,:) , Uf (2 ,:) , Uf (3 ,:) , '. ', 'Markersize',2); 
hold on;
plot3 (P1pos (1 ,:) ,P1pos (2 ,:) , P1pos (3 ,:) , '. ', 'Markersize',20);
quiver3 (P1pos(1) , P1pos(2) , P1pos(3) , p1dir(1) , p1dir(2) , p1dir(3) , 5); 
plot3 (P2pos (1 ,:) ,P2pos (2 ,:) , P2pos (3 ,:) , '. ', 'Markersize',20); 
quiver3 (P2pos(1) , P2pos(2) , P2pos(3) , p2dir(1) , p2dir(2) , p2dir(3) , 5); 



figure;imagesc(im1);
colormap gray


figure;imagesc(im2);
colormap gray


%hold on; 