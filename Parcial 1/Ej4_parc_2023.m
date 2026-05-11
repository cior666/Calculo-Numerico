addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
nodos = 41;            
n = nodos - 2;         
h = 1 / (nodos - 1);   

% 1. Construcción de la Matriz A (Tridiagonal)
v_prin = 2 * ones(n, 1);
v_sub  = -1 * ones(n-1, 1);
D_prin = diag(v_prin, 0);
D_sup  = diag(v_sub, 1);
D_inf  = diag(v_sub, -1);
A = D_prin + D_sup + D_inf;

% 2. Construcción del vector b
% Creamos el vector de posiciones x para los nodos interiores
x = (1:n)' * h;  
% Evaluamos la función del lado derecho: h^2 * 20 * e^(-10(x-0.7)^2)
b = (h^2) * 20 * exp(-10 * (x - 0.7).^2);
% Incorporamos las condiciones de contorno en los extremos
b(1) = b(1) + 5;      % u(0) = 5
b(n) = b(n) + 6;      % u(1) = 6

#pide resolver usando gauss seidel decir cuantas iteraciones fueron necesarias. Usar criterio de convergenia norma
#al infinito del residuo. Comenzar iteraciones con vector nulo y considerar un error del 10-6.
tol=1e-6;
maxit=100000; #le doy muchas its porque es un sistema muy grande
x0 = zeros(length(b), 1);
[x_gauss_seidel,it_gauss_seidel,rgauss_seidel,~]=gauss_seidel(A,b,x0,maxit,tol);
fprintf('el valor de x_gauss_seidel es: %.6f\n',x_gauss_seidel);
fprintf('el nro de iteraciones fue de: %f\n',it_gauss_seidel);
fprintf('el nro de iteraciones fue de: %f\n',length(rgauss_seidel));
#el valor del nro de iteraciones fue de: 1762.000000 o 1763.000000
T_medio = x_gauss_seidel(20);
fprintf('La temperatura en el punto medio de la barra es: %.6f\n', T_medio);
#el valor obtenido fue: 6.979986