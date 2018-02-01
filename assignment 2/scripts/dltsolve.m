function P = dltsolve(X, x)

zero = [0 0 0 0];
[m,n] = size(X);
 

[mx,nx] = size(x);



A = []
index = 1;
transpose(X(:,1));
for i = 1:n
   blockL = [transpose(X(:,i)) zero zero; zero transpose(X(:,i)) zero; zero zero transpose(X(:,i))];
   
   blockR = zeros(3, nx*4 -3);
   blockR(:,index) = -x(:,i);

   block = horzcat(blockL, blockR);
   A = vertcat(A, block);
   
   index = index + 4;
   
end

%P =A;

[U ,S ,V] = svd ( A );

V = transpose(V);
w = V(:,end)
P = reshape ( w (1:12) ,[4 3])';

<3


end

