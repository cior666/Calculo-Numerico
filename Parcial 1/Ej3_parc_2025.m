addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
t = [0; 0.0025; 0.005; 0.0075; 0.01];
b = [2.1004; 4.3702; 5.1745; -0.7222; 0.9249];
f = [440; 660; 1100; 5; 8]; 

% Armamos la matriz de coeficientes A (vectorizada)
A = zeros(5, 5);
A(:,1) = sin(2*pi*f(1)*t);
A(:,2) = sin(2*pi*f(2)*t);
A(:,3) = sin(2*pi*f(3)*t);
A(:,4) = cos(2*pi*f(4)*t); 
A(:,5) = sin(2*pi*f(5)*t);

x=gauss_p(A,b);
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));
fprintf('x4 = %.4f\n', x(4));
fprintf('x5 = %.4f\n', x(5));
#Los resultados obtenidos son: 
#x1 = 1.7564
#x2 = 2.0058
#x3 = -3.1075
#x4 = 2.1004
#x5 = -1.9224

#b) usando la matriz del inciso anterior al resolver el sistema por el metodo sor el w optimo con dos cifras decimales es:
#La solucion partiendo del vector nulo y deteniendo las iteraciones con un error entre dos iteraciones sucesivas usando norma
#a infinito de 1e-4 se obtiene en: x iteraciones.

#como aca en mi gauss_p no capturo el vector de permutacion que necesito para rearmar la matriz para poder hacer el sor
#me lo traigo con el algo de doolittle
[x, r] = gauss_p(A, b);

% 2. Usamos esa 'r' que acaba de salir de la función para reordenar
A_sor = A(r, :);
b_sor = b(r);

# Inicializo parámetros base
n = length(b_sor); 
x0 = zeros(n, 1);
tol = 1e-4; 
maxit = 10000;

# Inicializo las variables donde voy a guardar el mejor resultado
mejor_w = 0.1;
min_it = maxit;

# Recorremos estrictamente dentro de los límites del teorema (0 < w < 2)
for w = 0.1 : 0.1 : 1
    # Llamamos a SOR descartando el vector x y el historial rh (usando ~)
    [~, it, ~, ~] = sor(A_sor, b_sor, x0, maxit, tol, w);
    
    printf("w= %.1f | it= %d\n", w, it);
    # Actualizamos solo si mejoró la cantidad de iteraciones
    if (it < min_it)
        min_it = it;
        mejor_w= w;
    endif
endfor
mejor_w = 0.5;
min_it = maxit; # Asume que maxit ya está definido (ej: 10000)
# hago otro for p buscar mas fino
for w=0.6: 0.01: 0.7
  [~, it, ~, ~] = sor(A_sor, b_sor, x0, maxit, tol, w);
  printf("w= %d\n", w);
  printf("it= %d\n", it);
  if (it < min_it)
      min_it = it;
      mejor_w = w;
  endif
endfor
printf('\n================================================\n');
printf('El w optimo final con dos cifras decimales es: %.2f\n', mejor_w);
printf('Logro la convergencia en: %d iteraciones\n', min_it);
printf('================================================\n');