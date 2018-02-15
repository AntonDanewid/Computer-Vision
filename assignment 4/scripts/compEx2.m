close all;
clear
A = imread('a.jpg'); 
B = imread('b.jpg');





points1 = detectSURFFeatures ( rgb2gray ( A ));
points2 = detectSURFFeatures ( rgb2gray ( B ));

figure('Name','SURF Points','NumberTitle','off')
imshow ( A )
hold on
plot ( points1 . selectStrongest (200));
[ features1 , validPoints1 ] = extractFeatures ( rgb2gray ( A ) , points1 );
[ features2 , validPoints2 ] = extractFeatures ( rgb2gray ( B ) , points2 );


matches = matchFeatures ( features1 , features2 , 'Unique' , true );

x1 = validPoints1 ( matches (: , 1)). Location';
x2 = validPoints2 ( matches (: , 2)). Location';

perm = randperm ( size ( matches ,1));
figure('Name','Point correspondance','NumberTitle','off')
imagesc ([ A B ]);
hold on ;
plot ([x1(1,perm (1:10)); x2(1,perm(1:10))+ size(A,2)], ...
    [x1(2,perm (1:10)); x2(2,perm (1:10))],'-');
hold off ;



v=x1;
u=x2;

v=[v;ones(1,size(v,2))];
u=[u;ones(1,size(u,2))];


best_inliers = 0;
best_H = [];
zero = [0 0 0];

for i = 1:100
    
   
    rand = randi(length(v), [1  4]);
    tempv = v(:, rand);
    tempu = u(:, rand);
    
    M = dltsolve(tempv, tempu);
    [U,S,V]=svd(M);
    vsvd=V(:,end);
    H = reshape(vsvd(1:9), [3 3])';
    
    
    
    inliers = 0;
      
    
    for j=1:length(v)
       
        if norm(pflat(H*v(:,j))-u(:,j))<=5
            inliers = inliers +1
        end
    end
    if(inliers > best_inliers)
        best_inliers = inliers;
        best_H = H;
    end
        
      
    
    
    
end


bestH = best_H
bestH = double(bestH)
tform = maketform('projective', bestH');

transfbounds = findbounds(tform,[1 1; size(A ,2) size(A ,1)]);

xdata = [min([transfbounds(: ,1); 1]) max([transfbounds(: ,1); size(B ,2)])];
ydata = [min([transfbounds(: ,2); 1]) max([ transfbounds(: ,2); size(B ,1)])];

[ newA ] = imtransform(A , tform , 'xdata' , xdata , 'ydata', ydata );

tform2 = maketform('projective', eye (3));
[ newB ] = imtransform(B , tform2 , 'xdata', xdata , 'ydata' , ydata , 'size', size ( newA ), 'XYScale',1);

newAB = newB ;
newAB ( newB < newA ) = newA ( newB < newA );
figure;
imshow(B);
figure;
imshow(newAB)





