x=load('datos_velocidades.txt');
t=(0:0.2:5)';

%(a) Determine la funcion de la forma v(t) = c1 sen(2t)+c2t2 +c32t +c4 que mejor aproxima a los
%datos en el sentido de cuadrados mınimos. (Escriba el valor de c1, c2, c3 y c4 con 4 dıgitos).
%Utilice el modelo para predecir el valor de la velocidad a las 6 horas.

% INCISO (A): Ajuste por función propuesta
% Modelo: v(t) = c1*sin(2t) + c2*t^2 + c3*2^t + c4
% --------------------------------------------------------

% 1. Armamos la matriz M [4]
M = [sin(2*t), t.^2, 2.^t, ones(size(t))];
% 2. Ecuaciones Normales [1]
A_norm = M' * M;
b_norm = M' * x;

% REEMPLAZO 1: Usamos TU función GaussLUPP para resolver el sistema
% Esto nos devolverá el vector c con los 4 coeficientes
c = GaussLUPP(A_norm, b_norm); 
printf('--- INCISO A: Modelo No Lineal ---\n');
printf('Coeficientes hallados (4 digitos):\n');
printf('c1 = %.4f | c2 = %.4f | c3 = %.4f | c4 = %.4f\n\n', c(1), c(2), c(3), c(4));

t_pred = 6;
v_a_6 = c(1)*sin(2*t_pred) + c(2)*t_pred^2 + c(3)*2^t_pred + c(4);
printf('Prediccion modelo (a) a las 6 hs: %.4f km/h\n\n', v_a_6);

%(b) Hallar el polinomio p6 de grado menor o igual que 6 que aproxima a los datos en el sentido
%de los cuadrados mınimos. Utilice este modelo para predecir el valor de la velocidad a las 6
%horas.
p6 = min_cuadrados(t, x, 6);
%Evaluamos el polinomio p6 analíticamente en t=6 en vez de polyval
% Como tu min_cuadrados usa flip(), los coeficientes van de mayor a menor grado
v_b_6 = p6(1)*t_pred^6 + p6(2)*t_pred^5 + p6(3)*t_pred^4 + p6(4)*t_pred^3 + p6(5)*t_pred^2 + p6(6)*t_pred + p6(7);
printf('--- INCISO B: Modelo Polinomial (p6) ---\n');
printf('Prediccion modelo (b) a las 6 hs: %.4f km/h\n\n', v_b_6);

% INCISO (C): Error Cuadrático
% --------------------------------------------------------

% Evaluamos el modelo (a) matricialmente
v_aprox_a = M * c;

% Evaluamos el modelo (b) vectorialmente para todos los tiempos 't' (sin polyval)
v_aprox_b = p6(1)*t.^6 + p6(2)*t.^5 + p6(3)*t.^4 + p6(4)*t.^3 + p6(5)*t.^2 + p6(6)*t + p6(7);

% Calculamos la suma de distancias al cuadrado para ambos modelos [5, 6]
err_a = sum((x - v_aprox_a).^2);
err_b = sum((x - v_aprox_b).^2);

printf('--- INCISO C: Errores Cuadraticos ---\n');
printf('Error Cuadratico Modelo (a): %.4f\n', err_a);
printf('Error Cuadratico Modelo (b): %.4f\n\n', err_b);

% --------------------------------------------------------
% INCISO (D): Cálculo de la distancia
% Elegimos el modelo (a) por ser más estable para la extrapolación
% --------------------------------------------------------

% Definimos el modelo (a) como una función matemática anónima
v_fun = @(tiempo) c(1)*sin(2*tiempo) + c(2)*tiempo.^2 + c(3)*2.^tiempo + c(4);

% Integramos numéricamente para calcular la distancia [7]
distancia = quad(v_fun, 0, 6); 

printf('--- INCISO D: Distancia Recorrida ---\n');
printf('Distancia recorrida en las primeras 6 hs: %.4f km\n', distancia);