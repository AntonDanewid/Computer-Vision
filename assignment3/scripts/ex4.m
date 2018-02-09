F=[0 1 1; 1 0 0; 0 1 1]
e2 = null(transpose(F))

e2x = [0 1/sqrt(2) 0; -1/sqrt(2) 0 -1/sqrt(2); 0 1/sqrt(2) 02]
e2xF = e2x*F;

P2 = horzcat(e2xF, e2)

null(P2)