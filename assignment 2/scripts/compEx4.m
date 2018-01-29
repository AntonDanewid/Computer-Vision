im1 = imread('cube1.jpg');
im2 = imread('cube2.jpg');
points1 = detectSURFFeatures ( rgb2gray ( im1 ));
imshow ( im1 )
hold on
plot ( points1 . selectStrongest (200));
[ features1 , validPoints1 ] = extractFeatures ( rgb2gray ( im1 ) , points1 );
matches = matchFeatures ( features1 , features2 , 'Unique' , true );

x1 = validPoints1 ( matches (: , 1)). Location';
x2 = validPoints2 ( matches (: , 2)). Location';

perm = randperm ( size ( matches ,1));
figure ;
imagesc ([ im1 im2 ]);
hold on ;
plot ([x1(1,perm (1:10)); x2(1,perm(1:10))+ size(im1,2)], ...
    [x1(2,perm (1:10)); x2(2,perm (1:10))],'-');
hold off ;