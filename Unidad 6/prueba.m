% ============================================================
%  archi.m  -  Unidad 6: Integración numérica
%

%
%       v(t) = sqrt(g*m/cd) * tanh( sqrt(g*cd/m) * t )
%
%  La distancia recorrida es: x(T) = integral de 0 a T de v(t) dt
%
%  Inciso (a): distancia exacta a t = 10 s  (6 cifras exactas)
%  Inciso (b): distancia a t = 58 s con:
%              - Regla del Trapecio Compuesta  (L = 5 subintervalos)
%              - Cuadratura de Gauss (n=2 puntos, L = 5 subintervalos)
%              Comparar cifras exactas con la solución analítica.
% ============================================================

clear; clc; close all;

%% --- Parámetros del problema ---
m  = 68.1;    % masa [Kg]
cd = 0.25;    % coef. de arrastre de 2do orden [Kg/m]
g  = 9.81;    % aceleración de la gravedad [m/s^2]

% Constantes auxiliares
A = sqrt(g * m / cd);          % amplitud de velocidad [m/s]
B = sqrt(g * cd / m);          % factor temporal [1/s]

% Función velocidad
v = @(t) A * tanh(B * t);

% Solución exacta para la distancia: integral de v(t) = (m/cd)*ln(cosh(B*t))
x_exacta = @(T) (m/cd) * log(cosh(B * T));

% ============================================================
%  INCISO (a): Distancia exacta a t = 10 s
% ============================================================
T_a = 10;  % [s]

dist_exacta_10 = x_exacta(T_a);

printf('\n========================================================\n');
printf('  INCISO (a): Distancia a t = 10 s\n');
printf('========================================================\n');
printf('  Solución exacta: x(10) = %.6f m\n', dist_exacta_10);
printf('  (6 cifras exactas)\n\n');

% ============================================================
%  INCISO (b): Distancia a t = 58 s con métodos numéricos
%              L = 5 subintervalos
% ============================================================
T_b = 58;   % [s]
L   = 5;    % número de subintervalos

% --- Valor exacto de referencia ---
dist_exacta_58 = x_exacta(T_b);

printf('========================================================\n');
printf('  INCISO (b): Distancia a t = 58 s\n');
printf('========================================================\n');
printf('  Valor exacto:  x(58) = %.10f m\n\n', dist_exacta_58);

% ---- b.1) Regla del Trapecio Compuesta ----------------------
%  Usa la función trapcomp.m de la Unidad 6
%  trapcomp recibe vectores (x, y) de puntos

t_trap = linspace(0, T_b, L+1);    % L+1 nodos uniformes
y_trap = v(t_trap);

I_trap = trapcomp(t_trap, y_trap);

error_trap  = abs(I_trap - dist_exacta_58);
cifras_trap = -log10(error_trap / abs(dist_exacta_58));

printf('  --- Trapecio Compuesta (L = %d) ---\n', L);
printf('  Resultado:    %.10f m\n', I_trap);
printf('  Error abs.:   %.6e m\n', error_trap);
printf('  Cifras exactas: %.2f\n\n', cifras_trap);

% ---- b.2) Cuadratura de Gauss compuesta (n=2 puntos) ---------
%  Usa cuad_gauss_c.m y gauss_xw.m de la Unidad 6

n_gauss = 2;   % número de puntos de Gauss

I_gauss = cuad_gauss_c(v, 0, T_b, L, n_gauss);

error_gauss  = abs(I_gauss - dist_exacta_58);
cifras_gauss = -log10(error_gauss / abs(dist_exacta_58));

printf('  --- Cuadratura de Gauss (n=%d puntos, L=%d subintervalos) ---\n', n_gauss, L);
printf('  Resultado:    %.10f m\n', I_gauss);
printf('  Error abs.:   %.6e m\n', error_gauss);
printf('  Cifras exactas: %.2f\n\n', cifras_gauss);

% ============================================================
%  Resumen comparativo
% ============================================================
printf('========================================================\n');
printf('  RESUMEN INCISO (b)\n');
printf('========================================================\n');
printf('  Método                  | Resultado [m]       | Cifras exactas\n');
printf('  ------------------------|---------------------|---------------\n');
printf('  Exacto                  | %19.10f |     -\n', dist_exacta_58);
printf('  Trapecio Compuesta (L=5)| %19.10f |    %.2f\n', I_trap,   cifras_trap);
printf('  Gauss n=2  (L=5)        | %19.10f |    %.2f\n', I_gauss,  cifras_gauss);
printf('========================================================\n\n');

% ============================================================
%  Gráfico de v(t) en [0, 58] con los nodos del Trapecio
% ============================================================
t_fino = linspace(0, T_b, 500);

figure(1);
plot(t_fino, v(t_fino), 'b-', 'LineWidth', 2); hold on;
plot(t_trap, y_trap, 'ro--', 'LineWidth', 1.5, 'MarkerSize', 8);
fill([t_trap, fliplr(t_trap)], [y_trap, zeros(1, L+1)], ...
     'c', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
xlabel('Tiempo t [s]');
ylabel('Velocidad v(t) [m/s]');
title('Velocidad de caída con resistencia cuadrática del aire');
legend('v(t) exacta', 'Nodos Trapecio (L=5)', 'Área aproximada', ...
       'location', 'southeast');
grid on;
hold off;
