%la trayectoria de una particula que se mueve en el plano esta dada por
%la cursa x1,x2 donde las fucniones x1 y x2 son la sol del sgte sistema de ec
%diferenciales
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
h=0.05;
a=0;
b=20;
L=(b-a)/h;
%puedo definir al sistema como:
%x1'=-t*x2
%x2'=t*x1-t*x2

%como nos dice que en el instante 0 se encontraba en 
%1,-1 entonces podemos asumir la siguiente cond:
%x1(0)=1
%x2(0)=-1

%ahora defino al sistema como un vector columna
f=@(t,x) [
    -t*x(2);
    t*x(1)-t*x(2)
    ];
inter=[a b];
x0=[1;-1];
[t,x]=euler(f,inter,x0,L);
%euler me devuelve, en filas->instantes de tiempo
%en columnas-> variables de estado
% separo las variables para trabajar mas comodo
x1 = x(:,1);
x2 = x(:,2);
printf("sol para x1: %.15e\n",x1(end));
printf("sol para x2: %.15e\n",x2(end));
% GRAFICO DE LA TRAYECTORIA
figure
plot(x1,x2,'LineWidth',2)
hold on
plot(x1(1),x2(1),'ro')
plot(x1(end),x2(end),'ks')
grid on
xlabel('x_1')
ylabel('x_2')
title('Trayectoria de la particula')
legend('Trayectoria','Inicio','Fin')

% Buscar el primer instante en que la particula queda
% a menos de 0.01 unidades del atractor (0,0)
momento = -1; % valor por defecto

for i = 1:length(t)

    % distancia euclidea al origen
    dist = sqrt(x1(i)^2 + x2(i)^2);

    % verifico si entro dentro del radio 0.01
    if dist < 0.01

        % guardo el instante correspondiente
        momento = t(i);

        % guardo tambien el indice para marcarlo
        idx = i;

        break;

    endif

endfor

% mostrar resultado
printf("Primer instante con distancia < 0.01: %.4f\n",momento);

% marcar el punto en la trayectoria
hold on

plot(x1(idx),x2(idx),'ro', 'MarkerSize',8,'LineWidth',2)

legend('Trayectoria','Inicio', 'Fin', 'Distancia < 0.01')