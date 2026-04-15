x = linspace(-pi, pi, 100);
f = cos(x);

% (a) f(x) = cos(x) y g(x) = 1
figure(1);
plot(x, f, 'b-', x, ones(size(x)), 'r--');
title('Taylor grado 0'); legend('cos(x)', 'P_0(x)');

% (b) f(x) = cos(x) y g(x) = 1 - x^2 / 2!
figure(2);
plot(x, f, 'b-', x, 1 - x.^2/factorial(2), 'r--');
title('Taylor grado 2'); legend('cos(x)', 'P_2(x)');

% (c) f(x) = cos(x) y g(x) = 1 - x^2 / 2! + x^4 / 4!
figure(3);
plot(x, f, 'b-', x, 1 - x.^2/factorial(2) + x.^4/factorial(4), 'r--');
title('Taylor grado 4'); legend('cos(x)', 'P_4(x)');

% (d) f(x) = cos(x) y g(x) = 1 - ... - x^6 / 6!
figure(4);
plot(x, f, 'b-', x, 1 - x.^2/factorial(2) + x.^4/factorial(4) - x.^6/factorial(6), 'r--');
title('Taylor grado 6'); legend('cos(x)', 'P_6(x)');

pause(10); % Pausa para visualizar las gráficas