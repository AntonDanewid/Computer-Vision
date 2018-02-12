
A = imread('a.jpg'); 
B = imread('b.jpg');

points1 = detectSURFFeatures ( rgb2gray ( A ));
points2 = detectSURFFeatures ( rgb2gray ( B ));
plot ( points1 . selectStrongest (200));

[ features1 , validPoints1 ] = extractFeatures ( rgb2gray ( A ) , points1 );
[ features2 , validPoints2 ] = extractFeatures ( rgb2gray ( B ) , points2 );


matches = matchFeatures ( features1 , features2 , 'Unique' , true );

x1 = validPoints1 ( matches (: , 1)). Location';
x2 = validPoints2 ( matches (: , 2)). Location';


v=x1;
u=x2;

v=[v;ones(1,size(v,2))];
u=[u;ones(1,size(u,2))];


