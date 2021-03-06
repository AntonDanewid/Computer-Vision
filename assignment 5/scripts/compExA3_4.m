clear;
compExA3_3; 
close all;
W = [0 -1 0; 1 0 0; 0 0 1];

P1 = [U*W*V']
P1 = horzcat(P1, U(:,3));

P2 = [U*W*V']
P2 = horzcat(P2, -U(:,3));

P3 = [U*W'*V']
P3 = horzcat(P3, U(:,3));

P4 = [U*W'*V']
P4 = horzcat(P4, -U(:,3));

P0 = [1 0 0 0; 0 1 0 0; 0 0 1 0]
zero = [0; 0; 0];

x1 = x{1};
x2 = x{2};


x1n = K\x1; 
x2n = K\x2;
spacePoints1 = [];
for i=1:2008
   A= [];
   A= vertcat(A, P0);
   A= vertcat(A, P1);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints1 = horzcat(spacePoints1, P);
end
spacePoints1 = pflat(spacePoints1);
figure;
hold on;
plotcams({P0; P1});
plot3(spacePoints1(1,:),spacePoints1(2,:),spacePoints1(3,:),'.b','Markersize',2);
hold off;



spacePoints2 = [];
for i=1:2008
   A= [];
   A= vertcat(A, P0);
   A= vertcat(A, P2);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints2 = horzcat(spacePoints2, P);
end

spacePoints2 = pflat(spacePoints2);
figure;
hold on;
plotcams({P0; P2});

plot3(spacePoints2(1,:),spacePoints2(2,:),spacePoints2(3,:),'.b','Markersize',2);
hold off;


spacePoints3 = [];
for i=1:2008
   A= [];
   A= vertcat(A, P0);
   A= vertcat(A, P3);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints3 = horzcat(spacePoints3, P);
end

spacePoints3 = pflat(spacePoints3);
figure;
hold on;
plotcams({P0; P3});

plot3(spacePoints3(1,:),spacePoints3(2,:),spacePoints3(3,:),'.b','Markersize',2);
hold off;


spacePoints4 = [];
for i=1:2008
   A= [];
   A= vertcat(A, P0);
   A= vertcat(A, P4);
   block = [-x1n(:,i) zero;zero  -x2n(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints4 = horzcat(spacePoints4, P);
end



spacePoints4 = pflat(spacePoints4);
figure;
hold on;
plotcams({P0; P4});
plot3(spacePoints4(1,:),spacePoints4(2,:),spacePoints4(3,:),'.b','Markersize',2);
hold off;

P1 = K*P1
P2 = K*P2
P3 = K*P3
P4 = K*P4



xproj1 = pflat(P1*spacePoints1); 
figure; 
im2 = imread('kronan2.JPG');
imshow(im2);
hold on;
plot(xproj1(1,:),xproj1(2,:),'*');
plot(x2(1,:),x2(2,:),'ro');



xproj2 = pflat(P2*spacePoints2); 
figure; 
im2 = imread('kronan2.JPG');
imshow(im2);
hold on;
plot(xproj2(1,:),xproj2(2,:),'*');
plot(x2(1,:),x2(2,:),'ro');


xproj3 = pflat(P3*spacePoints3); 
figure; 
im2 = imread('kronan2.JPG');
imshow(im2);
hold on;
plot(xproj3(1,:),xproj3(2,:),'*');
plot(x2(1,:),x2(2,:),'ro');



xproj4 = pflat(P4*spacePoints4); 
figure; 
im2 = imread('kronan2.JPG');
imshow(im2);
hold on;
plot(xproj4(1,:),xproj4(2,:),'*');
plot(x2(1,:),x2(2,:),'ro');










