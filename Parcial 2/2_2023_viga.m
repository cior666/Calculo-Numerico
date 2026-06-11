% datos del problema
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
L = 120;
P = 3000;
E = 2.1e6;
I = 4250;
% sistema q quedo despejado en la hoja
f = @(x,y) [ y(2);(P*(L-x)/(E*I))*(1+y(2)^2)^(3/2)];
% intervalo
inter = [0 120];
% condiciones iniciales y0=0 y'(0)=0
y0 = [0;0];
N = 10;% cantidad de pasos
% resolver con rk4
[x,y] = rk4(f,inter,y0,N);
% como y'' > 0 y y'(0)=0 la funcion es creciente el maximo desplazamiento ocurre en x = L
x_max = x(end);
%como y esta compuesta por dos columnas y1=y y2=y', lo que hacemos cuando hacemos el y(end,1) es
%el end nos indica que vamos a la ultima fila (coincidente con el x max) y el 1 nos dice que es de la primera columna (y1=y)
desplazamiento_maximo=y(end,1);
disp(x_max); %osea seria L pero de esta manera aseguramos el maximo desplazamiento.
disp(desplazamiento_maximo);
%Resultados:
%x_max=120
%desplazamiento_maximo=0.1936

%b) me pide hallar cuando la pendiente de la curva se hace mayor a 0.0019
%primero planteo la grafica
%figure
%plot(x,y(:,2),'linewidth',2)
%hold on
%yline(0.0019,'r--')
%grid on
%xlabel('x [cm]')
%ylabel('y''(x)')
%title('busqueda de y'' = 0.0019')
%pause(15);

%% primer indice donde supera 0.0019
ind = find(y(:,2) > 0.0019,1);
% puntos vecinos
x1 = x(ind-1);
x2 = x(ind);
m1 = y(ind-1,2);
m2 = y(ind,2);
% interpolacion lineal
x_pend = x1 + (0.0019-m1)*(x2-x1)/(m2-m1);
printf('x = %.3f cm\n',x_pend); %da como resultado: x = 64.367 cm

% SOLUCION USANDO LAGRANGE Y BISECCION
ind = find(y(:,2) > 0.0019,1);
% tomo 3 puntos alrededor de la raiz
xlag = x(ind-1:ind+1);
ylag = y(ind-1:ind+1,2);
[P,L] = Lagrange(xlag,ylag);
g = @(x) polyval(P,x)-0.0019;
kmax=1000;
x_pend = biseccion(g,xlag(1),xlag(end),1e-8,kmax);
printf('x = %.3f cm\n',x_pend); %da como resultado: x = 64.367 cm

%b) usando spline + biseccion

%derivadas en los extremos
df1 = y(1,2);
df2 = y(end,2);
%funcion spline del desplazamiento
xx = x';
yy = y(:,1)';
[S,dS,ddS] = funcion_spline(xx,yy,df1,df2);

%grafico de la pendiente aproximada por spline
xg = linspace(0,120,1000);

%figure
%plot(xg,dS(xg),'linewidth',2)
%hold on
%yline(0.0019,'r--')
%grid on
%pause(15);
%de la grafica tomo un intervalo donde cambia de signo
a = 64.3;
b = 64.5;
%funcion para biseccion
g = @(x) dS(x)-0.0019;
kmax = 1000;
x_pend = biseccion(g,a,b,1e-9,kmax);
printf('x = %.3f cm\n',x_pend);