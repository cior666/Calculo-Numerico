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
%primera etapa va de 0 a 2
t1=[0;1;2];%valores del tiempo 0 1 2
x1=[0;2;6];%valores de x los saco de los ptos (0,0),(2,4),(6,6)
y1=[0;4;6];%valores de y los saco de los ptos (0,0),(2,4),(6,6)

%ahora obtenemos los coef a b c d para xt e yt
[ax1,bx1,cx1,dx1]=cubic_spline_clamped(t1,x1,df);
[ay1,by1,cy1,dy1]=cubic_spline_clamped(t1,y1,df);

%segunda etapa, va de 2 a 4
t2=[2;3;4];%valores del tiempo 2 3 y 4
x2=[6;3;0];%valores de x los saco de los ptos (6,6), (3,2) , (0,0)
y2=[6;2;0];%valores de y, los saco de los ptos (6,6), (3,2), (0,0)

%ahora obtenemos los coef a b c d para etapa 2
[ax2,bx2,cx2,dx2]=cubic_spline_clamped(t2,x2,df);
[ay2,by2,cy2,dy2]=cubic_spline_clamped(t2,y2,df);

% Tramo 1 (t de 0 a 1)
tt1_1 = linspace(0, 1, 50);
xx1_1 = ax1(1) + bx1(1)*(tt1_1 - 0) + cx1(1)*(tt1_1 - 0).^2 + dx1(1)*(tt1_1 - 0).^3;
yy1_1 = ay1(1) + by1(1)*(tt1_1 - 0) + cy1(1)*(tt1_1 - 0).^2 + dy1(1)*(tt1_1 - 0).^3;

% Tramo 2 (t de 1 a 2)
tt1_2 = linspace(1, 2, 50);
xx1_2 = ax1(2) + bx1(2)*(tt1_2 - 1) + cx1(2)*(tt1_2 - 1).^2 + dx1(2)*(tt1_2 - 1).^3;
yy1_2 = ay1(2) + by1(2)*(tt1_2 - 1) + cy1(2)*(tt1_2 - 1).^2 + dy1(2)*(tt1_2 - 1).^3;

% -- Evaluamos Etapa 2 --
% Tramo 1 (t de 2 a 3)
tt2_1 = linspace(2, 3, 50);
xx2_1 = ax2(1) + bx2(1)*(tt2_1 - 2) + cx2(1)*(tt2_1 - 2).^2 + dx2(1)*(tt2_1 - 2).^3;
yy2_1 = ay2(1) + by2(1)*(tt2_1 - 2) + cy2(1)*(tt2_1 - 2).^2 + dy2(1)*(tt2_1 - 2).^3;

% Tramo 2 (t de 3 a 4)
tt2_2 = linspace(3, 4, 50);
xx2_2 = ax2(2) + bx2(2)*(tt2_2 - 3) + cx2(2)*(tt2_2 - 3).^2 + dx2(2)*(tt2_2 - 3).^3;
yy2_2 = ay2(2) + by2(2)*(tt2_2 - 3) + cy2(2)*(tt2_2 - 3).^2 + dy2(2)*(tt2_2 - 3).^3;

% Juntamos todos los pedazos para tener los vectores completos
t_total = [tt1_1, tt1_2, tt2_1, tt2_2];
x_total = [xx1_1, xx1_2, xx2_1, xx2_2];
y_total = [yy1_1, yy1_2, yy2_1, yy2_2];

% ========================================================
% GRÁFICOS SOLICITADOS POR EL ENUNCIADO
% ========================================================

% (a) Gráfico X vs t
figure(1);
plot(t_total, x_total, 'b-', 'linewidth', 2);
hold on;
plot([t1; t2(2:3)], [x1; x2(2:3)], 'ro', 'markersize', 8); % Puntos nodales
title('(a) Posicion X vs Tiempo');
xlabel('Tiempo t (s)'); ylabel('Posicion X');
grid on; hold off;

% (b) Gráfico Y vs t
figure(2);
plot(t_total, y_total, 'g-', 'linewidth', 2);
hold on;
plot([t1; t2(2:3)], [y1; y2(2:3)], 'ro', 'markersize', 8);
title('(b) Posicion Y vs Tiempo');
xlabel('Tiempo t (s)'); ylabel('Posicion Y');
grid on; hold off;

% (c) Gráfico Y vs X (Trayectoria plana completa)
figure(3);
plot(x_total, y_total, 'k-', 'linewidth', 2);
hold on;
plot([x1; x2(2:3)], [y1; y2(2:3)], 'ro', 'markersize', 8);
title('(c) Trayectoria completa en el plano XY');
xlabel('Coordenada X'); ylabel('Coordenada Y');
grid on;
hold off;