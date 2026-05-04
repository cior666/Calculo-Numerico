% newton_raiz_multipleCorreg.m
% Función con raíz doble en x = 1
f  = @(x) (x - 1).^2;
df = @(x) 2*(x - 1);

% Newton modificado: multiplicidad conocida m = 2
m = 2;

% Aproximación inicial y parámetros
x0 = 2;                 % Punto de partida
N = 15;                 % Número de iteraciones
raiz = 1;               % Raíz exacta

% Inicialización
x_clasico = zeros(1, N);
x_modif   = zeros(1, N);
err_clasico = zeros(1, N);
err_modif   = zeros(1, N);

% Primera iteración
x_clasico(1) = x0;
x_modif(1)   = x0;
err_clasico(1) = abs(x0 - raiz);
err_modif(1)   = abs(x0 - raiz);

% Iteraciones
for k = 2:N
    % Newton clásico
    dfx = df(x_clasico(k-1));
    if dfx == 0
        warning('Derivada nula en Newton clásico, se detiene.');
        break
    end
    x_clasico(k) = x_clasico(k-1) - f(x_clasico(k-1)) / dfx;
    err_clasico(k) = abs(x_clasico(k) - raiz);

    % Newton modificado
    dfx_mod = df(x_modif(k-1));
    if dfx_mod == 0
        warning('Derivada nula en Newton modificado, se detiene.');
        break
    end
    x_modif(k) = x_modif(k-1) - m * f(x_modif(k-1)) / dfx_mod;
    err_modif(k) = abs(x_modif(k) - raiz);
end

% Graficar errores
figure;
loglog(1:N, err_clasico, 'r-o', 'DisplayName', 'Newton clásico');
hold on;
loglog(1:N, err_modif, 'b-s', 'DisplayName', 'Newton modificado (m=2)');
xlabel('Iteraciones');
ylabel('Error |x_n - \alpha|');
title('Convergencia de Newton para raíz doble');
legend('Location', 'southwest');
grid on;

