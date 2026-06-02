% Definimos la función, su derivada exacta y el punto de evaluación
f = @(x) exp(x) - 2*x.^2 + 3*x - 1;
df_exacta = @(x) exp(x) - 4*x + 3;
x0 = 0.0;
valor_exacto = df_exacta(x0); % Sabemos que esto da 4

% --------------------------------------------------------
% INCISO (A): Fórmula progresiva (hacia adelante) [cite: 184, 535]
% --------------------------------------------------------
% Generamos el vector h usando un barrido logarítmico desde 10^-11 a 10^-1
h = logspace(-11, -1, 200);

% Calculamos la derivada numérica progresiva (2 puntos)
derivada_prog = (f(x0 + h) - f(x0)) ./ h;

% Calculamos el error absoluto
error_prog = abs(derivada_prog - valor_exacto);

% --------------------------------------------------------
% INCISO (B): Comprobación de la cota teórica con h = 0.1 [cite: 536]
% --------------------------------------------------------
h_b = 0.1;
derivada_prog_b = (f(x0 + h_b) - f(x0)) / h_b;
error_b = abs(derivada_prog_b - valor_exacto);

% Calculamos la cota analítica: cota = ( max(|f''(x)|) / 2 ) * h
% f''(x) = exp(x) - 4. En el intervalo [0, 0.1], el valor máximo absoluto
% se da en x=0, donde |exp(0) - 4| = |-3| = 3.
max_f_segunda = 3; 
cota_teorica = (max_f_segunda / 2) * h_b;

printf('--- INCISO B: Verificación de Cota Teórica ---\n');
printf('Error real cometido con h=0.1: %f\n', error_b);
printf('Cota máxima teórica calculada: %f\n', cota_teorica);
if (error_b <= cota_teorica)
  printf('=> ¡Se verifica la cota teórica!\n\n');
endif

% --------------------------------------------------------
% INCISO (C): Fórmula centrada de 3 puntos [cite: 186, 536]
% (Nota: el TP dice "ejercicio 3a", pero se refiere al inciso 1a)
% --------------------------------------------------------
% Calculamos la derivada centrada
derivada_cent = (f(x0 + h) - f(x0 - h)) ./ (2 * h);

% Calculamos el error absoluto
error_cent = abs(derivada_cent - valor_exacto);

% --------------------------------------------------------
% GRÁFICOS (Escala logarítmica) [cite: 535, 741]
% --------------------------------------------------------
figure(1);
loglog(h, error_prog, 'b-', 'linewidth', 2);
hold on;
loglog(h, error_cent, 'r--', 'linewidth', 2);
grid on;

% Configuraciones visuales
set(gca, 'xdir', 'reverse'); % Invertimos el eje X para que 'h' disminuya hacia la derecha
title('Error Absoluto en Diferenciación Numérica vs. Tamaño de Paso (h)');
xlabel('Tamaño del paso (h)');
ylabel('Error Absoluto');
legend('Diferencia Progresiva (O(h))', 'Diferencia Centrada (O(h^2))', 'location', 'southwest');
hold off;