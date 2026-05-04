addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(x) x.^4+2.*x.^2-x-3;

g1=@(x)(3+x-2.*x.^2).^(1/4);
g2=@(x)sqrt(((x+3-x.^4)./2));
g3=@(x)sqrt(((x+3)./(x.^2+2)));
g4=@(x)(3.*x.^4+2.*x.^2+3)/(4.*x.^3+4.*x-1);

#defino los parametros
x0=1;
kmax=100;
tol=1e-5;

#hago el llamado a las funciones y devuelvo las it
[x1,h1]=puntofijo(g1,x0,tol,kmax);
fprintf('g1 convergio a x= %f\n',x1);
fprintf('el nro de iteraciones fue de: %f\n',length(h1)-1);

[x2,h2]=puntofijo(g2,x0,tol,kmax);
fprintf('g2 convergio a x= %f\n',x2);
fprintf('el nro de it fue de: %f\n',length(h2)-1);

[x3,h3]=puntofijo(g3,x0,tol,kmax);
fprintf('g3 convergio a x= %f\n',x3);
fprintf('el nro de it fue de: %f\n',length(h3)-1);

[x4,h4]=puntofijo(g4,x0,tol,kmax);
fprintf('g4 convergio x= %f\n',x4);
fprintf('el nro de it fue de: %f\n',length(h4)-1);

#Opcional: mirando el gr´afico de |g′i(x)| en el intervalo [1, 3/2], corrobore si lo observado experimentalmente 
#coincide con lo esperado desde el punto de vista teorico.
x = linspace(1, 1.5, 200);
abs_g1_prima = abs((1 - 4 .* x) ./ (4 .* (-2 .* x.^2 + x + 3).^(3 / 4)));
abs_g2_prima = abs((1 - 4 .* x.^3) ./ (2.^(3 / 2) .* sqrt(-x.^4 + x + 3)));
abs_g3_prima = abs(-(x.^2 + 6 .* x - 2) ./ (2 .* sqrt(x + 3) .* (x.^2 + 2).^(3 / 2)));
abs_g4_prima = abs((4 .* (3 .* x.^2 + 1) .* (x.^4 + 2 .* x.^2 - x - 3)) ./ (4 .* x.^3 + 4 .* x - 1).^2);

figure;
hold on; % Mantiene el gráfico activo para superponer curvas

% Graficamos las 4 funciones con distintos colores y marcadores
plot(x, abs_g1_prima, 'm-', 'linewidth', 1.5);
plot(x, abs_g2_prima, 'r-', 'linewidth', 1.5);
plot(x, abs_g3_prima, 'b-', 'linewidth', 1.5);
plot(x, abs_g4_prima, 'g-', 'linewidth', 1.5);

% Trazamos la línea límite del Teorema de Convergencia (|g'(x)| = 1)
plot(x, ones(size(x)), 'k--', 'linewidth', 2); 

% Configuraciones del gráfico
xlabel('x');
ylabel('|g''(x)|');
title('Análisis Teórico de Convergencia: |g''(x)|');
legend('|g_1''(x)|', '|g_2''(x)|', '|g_3''(x)|', '|g_4''(x)|', 'Límite Teórico |g''| = 1');
axis([1, 1.5, 0, 1.5]); % Limitamos el eje Y para una mejor lectura visual
grid on;
hold off;
pause(30);

