%se sospecha q los datos de la sgte taabla 
x=[-1;0;1;2];
y=[-1.1;-0.4;-0.9;-2.7];
%fueron producidos por una funcion de la forma 
%-eax^2+bx+c
y2=log(-y); %esto lo hacemos porq suponemos q fue producido
%por la funcion q mostramos arriba, entonces para "bajar" 
%el exponente le aplicamos el ln.
p=polyfit(x,y2,2);
disp('Los coeficientes hallados para el modelo son [a, b, c]:');
disp(p);

% Generamos un vector 'xx' suave en el intervalo pedido [-1.5, 2.5] [cite: 146]
xx = linspace(-1.5, 2.5, 200);

% 1. Evaluamos el polinomio cuadrático con los puntos 'xx'
% yy2_eval representa los valores de ln(-y)
yy2_eval = polyval(p, xx);

% 2. DESHACEMOS LA TRANSFORMACIÓN para graficar la curva original
% Sabiendo que yy2 = ln(-y)  =>  e^(yy2) = -y  =>  y = -e^(yy2)
yy_eval = -exp(yy2_eval);

% Graficamos
figure(1);
% Graficamos los datos experimentales originales con círculos rojos [cite: 179]
plot(x, y, 'ro', 'markersize', 8, 'markerfacecolor', 'r'); 
hold on;
% Graficamos la curva exponencial ajustada con línea continua azul [cite: 146]
plot(xx, yy_eval, 'b-', 'linewidth', 2); 
grid on;

% Configuraciones visuales del gráfico
title('Ajuste No Lineal mediante Cuadrados Minimos');
xlabel('Eje x'); 
ylabel('Eje y');
legend('Datos experimentales', 'Curva ajustada y = -e^{ax^2+bx+c}', 'Location', 'southwest');
hold off;