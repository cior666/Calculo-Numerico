% vEj17Burden_visualiza_serie_armonica.m
% Número máximo de términos
N = 1000;

% Inicialización
pn = zeros(1, N);
incremento = zeros(1, N);

% Calcular la sucesión y el incremento
for n = 1:N
    pn(n) = sum(1./(1:n));        % p_n
    if n > 1
        incremento(n) = pn(n) - pn(n-1);  % p_n - p_{n-1} = 1/n
    else
        incremento(n) = pn(n);    % El primer término
    end
end

% Graficar p_n
figure;
subplot(2,1,1)
plot(1:N, pn, 'b', 'LineWidth', 1.5);
xlabel('n'); ylabel('p_n');
title('Sucesión p_n = sum_{k=1}^n (1/k)');
grid on;

% Graficar incremento
subplot(2,1,2)
semilogy(2:N, incremento(2:N), 'r', 'LineWidth', 1.5);  % desde n=2 para evitar div/0
xlabel('n'); ylabel('p_n - p_{n-1}');
title('Incremento entre términos (tiende a cero)');
grid on;

