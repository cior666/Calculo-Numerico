%Ejercicio 3. (Aula) Evalue la funcion f(x) = sin(2πx) en 21 puntos equiespaciados en el intervalo
%[−1,1]. Calcule el polinomio interpolador de Lagrange y el trazador cubico natural. Compare las
%graficas de estas dos funciones con la de f(x) en el intervalo dado. Repita el mismo calculo usando
%el siguiente conjunto de datos perturbados: f(xi) = sin(2πxi)+(−1)i+110−4, y observe que el polinomio interpolador de Lagrange 
%es mas sensible a pequenas perturbaciones que el trazador cubico.
x_real=linspace(-1,1,500);
f_real=sin(2*pi.*x_real);

%ahora tengo que generar los 21 puntos equiespaciados(serian mis nodos de interpolacion)
x_nodos=linspace(-1,1,21);
y_nodos_ideales=sin(2*pi.*x_nodos);

%ahora genero la senal con ruido
ruido=zeros(1,21);
for i=1:21
    ruido(i)=((-1)^(i+1))*1e-4; 
end
y_nodos_ruido=y_nodos_ideales+ruido;

% Ahora resolvemos en cond ideales
% Polinomio interpolador de Lagrange (grado 20, n-1 = 21-1 = 20)
[p_lagrange_ideal, ~] = Lagrange(x_nodos, y_nodos_ideales);
y_lagrange_ideal = polyval(p_lagrange_ideal, x_real);

% Trazador cubico NATURAL: obtenemos coeficientes y evaluamos con spline_eval
[a_id, b_id, c_id, d_id] = cubic_spline_natural(x_nodos, y_nodos_ideales);
y_spline_ideal = spline_eval(x_real, x_nodos, a_id, b_id, c_id, d_id);

% Ahora resuelvo con ruido
[p_lagrange_ruido, ~] = Lagrange(x_nodos, y_nodos_ruido);
y_lagrange_ruido = polyval(p_lagrange_ruido, x_real);

% Trazador cubico NATURAL con ruido
[a_ru, b_ru, c_ru, d_ru] = cubic_spline_natural(x_nodos, y_nodos_ruido);
y_spline_ruido = spline_eval(x_real, x_nodos, a_ru, b_ru, c_ru, d_ru);

figure(1);
subplot(1,2,1);
plot(x_real, f_real, 'k-', 'linewidth', 2, x_nodos, y_nodos_ideales, 'ro');
hold on;
plot(x_real, y_lagrange_ideal, 'b--');
plot(x_real, y_spline_ideal, 'g-.');
title('Datos Ideales');
legend('f(x) real', 'Nodos', 'Lagrange (Grado 20)', 'Spline Cubico');
grid on; hold off;

subplot(1,2,2);
plot(x_real, f_real, 'k-', 'linewidth', 2, x_nodos, y_nodos_ruido, 'ro');
hold on;
plot(x_real, y_lagrange_ruido, 'b--');
plot(x_real, y_spline_ruido, 'g-.');
title('Datos Perturbados (Ruido 10^{-4})');
legend('f(x) real', 'Nodos', 'Lagrange Perturbado', 'Spline Perturbado');
grid on;
hold off;