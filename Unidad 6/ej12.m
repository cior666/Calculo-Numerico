
% 1 defino funcion a integrar
% se multiplica toda la temperatura u(r,theta) por el jacobiano 'r'.
f = @(theta, r) (10 + (r.^3).*cos(3*theta) + 2*(r.^2).*sin(2*theta)) .* r;

% 2 limites de integracion
a = -pi;   % limite inferior del angulo
b = pi;    % limite superior del angulo
c = 0;     % limite inferior de r
d = 1;     % limite superior de r

% 3 cantidad de nodos p hacer la cuadratura
m = 5;     % para el angulo
n = 5;     % para el radio

%calculo el integral
I = cuad_gauss_doble(f, a, b, c, d, m, n);

printf('--- RESULTADOS ---\n');
printf('Valor numérico de la integral doble = %.6f\n', I);

% (Opcional) Verificación contra el valor analítico exacto que es 10*pi
printf('Valor exacto (10*pi)                = %.6f\n\n', 10*pi);

printf('La Energía Térmica total de la placa es:\n');
printf('E = %.6f * c * rho\n', I);