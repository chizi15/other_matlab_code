syms g1x1 x1  g1x2 x2  g1x3 x3  g1x4 x4 g1x5 x5  g1x6 x6  g1x7 x7 ...
    g2x1 x1  g2x2 x2  g2x3 x3  g2x4 x4  g2x5 x5  g2x6 x6  g2x7 x7...
    g3x1 x1  g3x2 x2  g3x3 x3  g3x4 x4  g3x5 x5  g3x6 x6  g3x7 x7
%% 
a = g1x1*x1 + g1x2*x2 + g1x3*x3 + g1x4*x4 + g1x5*x5 + g1x6*x6 + g1x7*x7 ;
b = g2x1*x1 + g2x2*x2 + g2x3*x3 + g2x4*x4 + g2x5*x5 + g2x6*x6 + g2x7*x7 ;
c = g3x1*x1 + g3x2*x2 + g3x3*x3 + g3x4*x4 + g3x5*x5 + g3x6*x6 + g3x7*x7 ;
[x1,x2,x3] = solve(a == 0,b == 0,c == 0,x1,x2,x3);
disp('x1 is :'), pretty(x1), disp('x2 is :'), pretty(x2), disp('x3 is :'), pretty(x3)

% d = g1x1*x1 + g1x2*x2 + g1x3*x3 + g1x4*x4;
% e = g2x1*x1 + g2x2*x2 + g2x3*x3 + g2x4*x4;
% [x1,x2] = solve(d == 0,e == 0,x1,x2);
% disp('x1 is :'), pretty(x1), disp('x2 is :'), pretty(x2)

%% 
J = [g1x1 g1x2 g1x3; g2x1 g2x2 g2x3; g3x1 g3x2 g3x3];
disp('matrix J is :'), pretty(J)
Jsum = det(J);
disp('the determinant of J is :'), disp(Jsum)

A11 = [g3x4 g3x3 g3x2; g2x4 g2x3 g2x2; g1x4 g1x3 g1x2];
disp('matrix A11 is :'), pretty(A11)
A11sum = det(A11);
disp('the determinant of A11 is :'), disp(A11sum)

A22 = [g3x3 g3x5 g3x1; g2x3 g2x5 g2x1; g1x3 g1x5 g1x1];
disp('matrix A22 is :'), pretty(A22)
A22sum = det(A22);
disp('the determinant of A11 is :'), disp(A22sum)