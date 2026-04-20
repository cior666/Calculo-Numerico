#resolver usando todos los metodos presentados en la guia.
#tasa de tolerancia es 10^-5 para la convergencia.
#estimar el costo del metodo en funcion del tiempo reloj de ejecucion 
#comandoos tic y toc. el nro de iteraciones y la tasa de convergencia 
#realizar las graficas norma del residuo vs iteraciones usando la func semiology 
#analizar los resultados obtenidos e indicar cual metodo es mas conveniente segun yo.
#como justifica que los metodos iterativos logren o no la convergencia? 
#que expectativa puedo tener sobre la precision de los resultados obtenidos?
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#jacobi gaussdisel y sor
n = 1000;

% 1. Diagonal Principal (k = 0)
% i va de 1 a n
v_diag = 2 * (1:n)';
D_prin = diag(v_diag, 0);

% 2. Diagonales a distancia 2 (k = 2 y k = -2)
% Superior: i va de 1 a n-2
v_sup2 = 0.5 * (1:n-2)';
D_sup2 = diag(v_sup2, 2);

% Inferior: i va de 3 a n
v_inf2 = 0.5 * (3:n)';
D_inf2 = diag(v_inf2, -2);

% 3. Diagonales a distancia 4 (k = 4 y k = -4)
% Superior: i va de 1 a n-4
v_sup4 = 0.25 * (1:n-4)';
D_sup4 = diag(v_sup4, 4);

% Inferior: i va de 5 a n
v_inf4 = 0.25 * (5:n)';
D_inf4 = diag(v_inf4, -4);

% 4. Ensamblamos la matriz A sumando todas las matrices dispersas
A = D_prin + D_sup2 + D_inf2 + D_sup4 + D_inf4;

% 5. Vector de términos independientes (bi = pi)
b = pi * ones(n, 1);

#para verificar que es EDD o SDP invoco a la func:
%esedd=edd(A);
%essdp=sdp(A);
%disp('EDD:');
%disp(esedd);
%disp('SDP:');
%disp(essdp);  
#como vemos que es EDD entonces podemos saber que cualquier metodo que apliquemos
#es valido (al menos los de esta unidad). Entonces:

#hago jacobi
jacobi_tic= tic; #inicializo el cronometro para comenzar a medir el tiempo
x0 = zeros(length(b), 1);
maxit=1000; #cant max de iteraciones
tol = 1e-5; #tolerancia a la covnergencia
[x_jacobi, rh_jacobi, it_jacobi] = jacobi(A,b,x0,maxit,tol);
jacobi_toc = toc(jacobi_tic);
printf("Jacobi: it = %d, tiempo = %.4f segundos\n", it_jacobi, jacobi_toc);

#hago gauss seidel
gauss_tic=tic;
x0 = zeros(length(b), 1);
maxit=1000;
tol = 1e-5;
[x_gauss, rh_gauss, it_gauss] = gaussseidel(A,b,x0,maxit,tol);
gauss_toc = toc(gauss_tic);
printf("Gauss-Seidel: it = %d, tiempo = %.4f segundos\n", it_gauss, gauss_toc);

#ahora para el sor, como no tengo w tengo que hacer lo del ej 4
#inicializo parámetros base
x0 = zeros(n, 1);
tol = 1e-5; 
maxit = 1000; 

#inicializo las variables donde voy a guardar el mejor resultado.
mejor_w = 1.0;
min_it = maxit;

disp('busco el w optimo');

#recorro de w a 1.9, saltando de 0.1 en 0.1, porq el max w es 2.
for w = 1.0 : 0.1 : 1.9
    
    #cronometro cada ejecucion
    tic_sor = tic;
    
    #llamo a sor pero ignorando los vectores porq solo me importa saber 
    #cual es la menor cantidad de iteraciones.
    [~, ~, it] = sor(A, b, x0, maxit, tol, w);
    #corto
    tiempo_w = toc(tic_sor);
    
    #miro los resultados
    printf('w = %.1f | Iteraciones: %d | Tiempo: %.4f seg\n', w, it, tiempo_w);
    
    #actualizo el mejor valor
    if (it < min_it)
        min_it = it;
        mejor_w = w;
    endif
    
endfor

#cuando encuentro el mejor w se lo paso a la funcion sor
tic_sor_final = tic;
# El orden debe ser: 1. solucion (x), 2. residuos (rh), 3. iteraciones (it)
[x_sor, rh_sor, it_sor] = sor(A, b, x0, maxit, tol, mejor_w);
tiempo_sor_final = toc(tic_sor_final);
# muestro los resultados
printf("SOR w = %.1f, It: %d, Tiempo: %.4f seg\n", mejor_w, it_sor, tiempo_sor_final);

#ahora viene la parte de graficar usando semiology
# hago una sola ventana para ver los 3 graficos juntos
figure;
hold on; 

#grafico jacobi
#grafico con el tamano de rh jacobi
len_jacobi = length(rh_jacobi);
semilogy(1:len_jacobi, rh_jacobi, 'r-o', 'linewidth', 1.5);

#grafico gauss
len_gauss = length(rh_gauss);
semilogy(1:len_gauss, rh_gauss, 'g-x', 'linewidth', 1.5);

#grafico sor
len_sor = length(rh_sor);
semilogy(1:len_sor, rh_sor, 'b-*', 'linewidth', 1.5);

xlabel('Número de Iteraciones');
ylabel('Error Relativo (Norma Infinito)'); 
title('Convergencia de los Métodos Iterativos (Matriz 1000x1000)');
grid on;

legend('Jacobi', 'Gauss-Seidel', sprintf('SOR (w=%.1f)', mejor_w));
pause(100);
hold off;