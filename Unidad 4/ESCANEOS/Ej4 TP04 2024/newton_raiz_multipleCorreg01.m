% newton_raiz_multipleCorreg01.m
% Newton para raíz doble: versión corregida con tolerancia
clear all; clc
f  = @(x) (x - 1).^2;
df = @(x) 2*(x - 1);
m = 2;

x0 = 2;
N = 15;
raiz = 1;
tol = 1e-12;

x_clasico = zeros(1, N);
x_modif   = zeros(1, N);
err_clasico = zeros(1, N);
err_modif   = zeros(1, N);

x_clasico(1) = x0;
x_modif(1) = x0;
err_clasico(1) = abs(x0 - raiz);
err_modif(1)   = abs(x0 - raiz);

for k = 2:N
    dfx = df(x_clasico(k-1));
    if abs(dfx) < tol
        warning('Derivada casi nula en Newton clásico, se detiene.');
        break
    end
    x_clasico(k) = x_clasico(k-1) - f(x_clasico(k-1)) / dfx;
    err_clasico(k) = abs(x_clasico(k) - raiz);

    dfx_mod = df(x_modif(k-1));
    if abs(dfx_mod) < tol
        warning('Derivada casi nula en Newton modificado, se detiene.');
        break
    end
    x_modif(k) = x_modif(k-1) - (m * f(x_modif(k-1)) / (dfx_mod));
    err_modif(k) = abs(x_modif(k) - raiz);
end

figure;
loglog(1:N, err_clasico, 'r-o', 'DisplayName', 'Newton clásico');
hold on;
loglog(1:N, err_modif, 'b-s', 'DisplayName', 'Newton modificado (m=2)');
xlabel('Iteraciones');
ylabel('Error |x_n - \alpha|');
title('Convergencia de Newton para raíz doble');
legend('Location', 'southwest');
grid on;
