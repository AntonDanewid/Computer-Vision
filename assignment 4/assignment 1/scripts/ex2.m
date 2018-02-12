H=[1, -1, 0; 0, 1, 0; 1, -1, 1];
x = [1 0 1; 0 1 1];
disp('Line 1')
L1 = pflat(null(x))
y1 = H *[1;0;1];
y2 = H *[0;1;1];
test = [y1,y2];
L2 = pflat(null(transpose(test)))