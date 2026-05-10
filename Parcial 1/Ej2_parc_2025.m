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

#el valor de x1 es: 6.000
#el valor de x2 es: -7.000
#el valor de x3 es: -1.000
#el valor de x4 es: 6.000
#el valor de x5 es: 9.000

#ahora pide resolver por gauss seidel y por jacobi. Usando norma al infinito entre dos iteraciones sucesivas.
#con tolerancia 10-4.
tol=1e-4;
maxit=1000;
x0 = zeros(length(b), 1);
[xg,itg,~,~]=gauss_seidel(A,b,x0,maxit,tol);
#diverge por llegar a max it sin converger
[x_jacobi,it,~,~]=jacobi(A,b,x0,maxit,tol);
fprintf('el valor al que converge jacobi es: %f\n');
disp(x_jacobi);
fprintf('el nro de iteraciones jacobi es: %f\n',it)
#converge a 6.0002
#  -7.0002
#  -1.0002
#   5.9996
#   8.9998
#en 965 iteraciones

#calcular el error relativo en norma infinito que se comente en la solucion con el metodo de jacobi respecto a la eliminacion 
#de gauss (ereportar con 3 cifras exactas)
error_relativo = norm(x_jacobi - x, inf) / norm(x, inf);
disp('El error relativo con Jacobi es:');
fprintf('%.2e\n', error_relativo); 
#el valor obtenido es 4.96e-05