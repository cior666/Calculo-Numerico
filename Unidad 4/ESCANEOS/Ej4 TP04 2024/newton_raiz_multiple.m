% newton_raiz_multiple.m
clear all, clc;
% Función con raíz doble en x = 1
f  = @(x) (x - 1).^2;
df = @(x) 2*(x - 1);

% Newton modificado: multiplicidad conocida m = 2
m = 2;

% Parámetros
x0 = 2;                % Aproximación inicial
N = 15;                % Iteraciones
raiz = 1;

% Inicializar vectores
x_clasico = zeros(1,N);
x_modif   = zeros(1,N);
err_clasico = zeros(1,N);
err_modif   = zeros(1,N);

% Condiciones iniciales
x_clasico(1) = x0;
x_modif(1)   = x0;

% Iteraciones
for k = 2:N
    % Newton clásico
    x_clasico(k) = x_clasico(k-1) - f(x_clasico(k-1)) / df(x_clasico(k-1));
    err_clasico(k) = abs(x_clasico(k) - raiz);

    % Newton modificado
    x_modif(k) = x_modif(k-1) - m * f(x_modif(k-1)) / df(x_modif(k-1));
    err_modif(k) = abs(x_modif(k) - raiz);
end

% Graficar errores en escala log-log
figure (1);
%loglog(1:N, err_clasico, 'r-o', 'DisplayName', 'Newton clásico');
semilogy(1:N, err_clasico, 'r-o', 'DisplayName', 'Newton clásico');
title('Convergencia de Newton con raíz doble-Clasico');
grid on; grid minor
%hold on;
figure(2)
semilogy(1:N, err_modif, 'b-s', 'DisplayName', 'Newton modificado (m=2)');
%xlabel('Iteraciones');
%ylabel('Error |x_n - \alpha|');
title('Convergencia de Newton con raíz doble');
legend('Location','southwest');
grid on; grid minor

