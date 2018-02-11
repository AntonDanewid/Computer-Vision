%compEx3; 

W = [0 -1 0; 1 0 0; 0 0 1];

P1 = [U*W*V']
P1 = horzcat(P1, U(:,3));

P2 = [U*W*V']
P2 = horzcat(P2, -U(:,3));

P3 = [U*W'*V']
P3 = horzcat(P3, U(:,3));

P4 = [U*W'*V']
P4 = horzcat(P4, -U(:,3));

P0 = [1 0 0 0: 0 1 0 0: 0 0 1 0]
zero = [0; 0; 0];
for i=1:257
   A= [];
   A= vertcat(A, P0);
   A= vertcat(A, P1);
   block = [-x11(:,i) zero;zero  -x21(:,i)];
   A = horzcat(A, block);
   [U ,S ,V] = svd ( A );
   P = V(:,end); 
   P = reshape ( P (1:4) ,[1 4])';
   spacePoints = horzcat(spacePoints, P);
end

