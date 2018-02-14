function P = dltsolve(X, x)

zero = [0 0 0 ];
[m,n] = size(X);
 

[mx,nx] = size(x);

%Builds the DLT for CompEx 3

A = [];
index = 1;
transpose(X(:,1));
for i = 1:n
   blockL = [transpose(X(:,i)) zero zero; zero transpose(X(:,i)) zero; zero zero transpose(X(:,i))];
   
   blockR = zeros(3, nx);
   blockR(:,i) = -x(:,i);

   block = horzcat(blockL, blockR);
   A = vertcat(A, block);
   
   index = index + 4;
   
end


P = A;

end

