%Ejercicio 5. (Aula) Se quiere determinar la trayectoria plana seguida por un brazo robot industrial (idealizado por un punto material) 
%durante un ciclo de trabajo. El brazo robot debe satisfacer las siguientes restricciones: 
%se debe encontrar en reposo en el punto (0,0) en el instante inicial.
%Luego de 1s se debe encontrar en el punto (2,4), 1s despues debe alcanzar el punto (6,6) y detenerse allı(primera etapa). 
%En una segunda etapa retoma inmediatamente su movimiento y alcanza,luego de otro segundo m´as el punto (3,2) para finalmente retornar al origen
% luego de otro segundo mas, donde quedara detenido para repetir el ciclo de trabajo.
%Encuentre el trazador cubico sujeto correspondiente utilizando el codigo desarrollado en el ejercicio 7 y luego realice las siguientes 
%graficas: (a) x vs. t (etapas 1 y 2 en la misma grafica), (b) y vs. t (idem anterior), y finalmente (c) en el plano xy la trayectoria completa 
%encontrada.
%polyfit: Dado un conjunto de datos (xi,yi), la funcion p=polyfit(x,y,n) de Octave devuelve un
%vector p cuyas componentes son los coeficientes del polinomio de grado n que ajusta a los datos en
%el sentido de cuadrados mınimos.

%como parte de reposo y se detiene al final de cada etapa, las velocidades en los extremos
%son cero
df=[0;0];
%primera etapa va de t=0 a t=2
% (0,0) -> (2,4) -> (6,6)  reposo en ambos extremos
t1 = [0, 1, 2];
x1 = [0, 2, 6];
y1 = [0, 4, 6];

%segunda etapa, va de t=2 a t=4
% (6,6) -> (3,2) -> (0,0)  reposo en ambos extremos
t2 = [2, 3, 4];
x2 = [6, 3, 0];
y2 = [6, 2, 0];



% Llamamos a la función del profesor indicando derivadas 0 en los extremos
[Sx1, vel_x1, acel_x1] = funcion_spline(t1, x1, 0, 0);
[Sy1, vel_y1, acel_y1] = funcion_spline(t1, y1, 0, 0);

[Sx2, vel_x2, acel_x2] = funcion_spline(t2, x2, 0, 0);
[Sy2, vel_y2, acel_y2] = funcion_spline(t2, y2, 0, 0);
% ========================================================
% EVALUACIÓN AUTOMÁTICA
% ========================================================
% Generamos vectores de tiempo fino para graficar curvas suaves
t_fino1 = linspace(0, 2, 100);
t_fino2 = linspace(2, 4, 100);

xx1 = Sx1(t_fino1);
yy1 = Sy1(t_fino1);

xx2 = Sx2(t_fino2);
yy2 = Sy2(t_fino2);

% Concatenamos los resultados para los gráficos (a) y (b)
t_total = [t_fino1, t_fino2];
x_total = [xx1, xx2];
y_total = [yy1, yy2];

% ========================================================
% GRÁFICOS SOLICITADOS [cite: 528]
% ========================================================

% (a) Gráfico X vs t
figure(1);
plot(t_total, x_total, 'b-', 'linewidth', 2);
hold on;
% CORRECCIÓN: Usamos coma en lugar de punto y coma para vectores fila
plot([t1, t2(2:3)], [x1, x2(2:3)], 'ro', 'markersize', 8, 'markerfacecolor', 'r'); 
title('(a) Posicion X vs Tiempo');
xlabel('Tiempo t (s)'); ylabel('Posicion X');
grid on; hold off;

% (b) Gráfico Y vs t
figure(2);
plot(t_total, y_total, 'g-', 'linewidth', 2);
hold on;
% CORRECCIÓN: Usamos coma en lugar de punto y coma
plot([t1, t2(2:3)], [y1, y2(2:3)], 'ro', 'markersize', 8, 'markerfacecolor', 'r');
title('(b) Posicion Y vs Tiempo');
xlabel('Tiempo t (s)'); ylabel('Posicion Y');
grid on; hold off;

% (c) Gráfico Y vs X (Trayectoria plana completa separando etapas)
figure(3);
plot(xx1, yy1, 'b-', 'linewidth', 2); % Etapa 1 en Azul
hold on;
plot(xx2, yy2, 'm-', 'linewidth', 2); % Etapa 2 en Magenta
% CORRECCIÓN: Usamos coma en lugar de punto y coma
plot([x1, x2(2:3)], [y1, y2(2:3)], 'ro', 'markersize', 8, 'markerfacecolor', 'r');
title('(c) Trayectoria completa en el plano XY');
xlabel('Coordenada X'); ylabel('Coordenada Y');
legend('Etapa 1 (Ida)', 'Etapa 2 (Retorno)', 'Nodos', 'Location', 'northwest');
grid on; 
hold off;