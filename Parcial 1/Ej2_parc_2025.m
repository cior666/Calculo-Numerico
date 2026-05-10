addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
A=[ 2, 1, 0, -2,1;
2, 2, 1, 2, -1;
-2, -2, 2, 1 ,0;
-1, 1, 1, 2, 1;
-2, 2, -2, 0, 3];
b=[2;0;6;7;3];

#hay que resolver usando gauss
x=gauss(A,b);
fprintf('el valor de x1 es: %.3f\n',x(1));
fprintf('el valor de x2 es: %.3f\n',x(2));
fprintf('el valor de x3 es: %.3f\n',x(3));
fprintf('el valor de x4 es: %.3f\n',x(4));
fprintf('el valor de x5 es: %.3f\n',x(5));