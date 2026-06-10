addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%como el sistema esta de grado 4 en derivadas tengo que hacer un cambio de varibale
%entonces defino:
    %x1=y, x2=y', x3=y''
%entonces
    %x1'=x2 y x2'=x3
%ahora procedo a despejar y^3'
%y'''=-4y''-5y'-2y-4sin(t)-2cos(t)

%reemplazando con los despejes anteriores
%x3'=-4x3-5x2-2x1-4sin(t)-2cos(t)

%finalmente obtengo:
%x1'=x2, x2'=x3, x3'=-4x3-5x2-2x1-4sin(t)-2cos(t)
%con cond iniciales x1(0)=1, x2(0)=0, x3(0)=-1

%uso rk4:
f=@(t,x)[x(2);
x(3);
-4*x(3)-5*x(2)-2*x(1)-4*sin(t)-2*cos(t)];
a=0;
b=15;
h=0.01
L=(b-a)/h;
intervalo=[a b];
x0=[1;0;-1];

%ahora que tengo todo definido llamo al rk4
[t,x]=rk4(f,intervalo,x0,L);
y=x( :,1); %seria x1 osea y
yp=x(:,2); %seria x2 osea y'
ypp=x(:,3); %seria x3 osea y''
%los valores vienen del reemplazo que tome antes para resolver el sistema
%para el inciso c: Indique cuantas veces se anula la funcion y′(t) en el intervalo [0,15]
cantidad_ceros = 0;
raices = [];
for i = 1:length(yp)-1
    if yp(i)*yp(i+1) < 0
        cantidad_ceros = cantidad_ceros + 1;
        % aproximacion del instante
        raices(end+1) = (t(i)+t(i+1))/2;
    endif
endfor
printf("Cantidad de ceros de y'(t): %d\n",cantidad_ceros);
disp("Instantes aproximados:");
disp(raices');

figure
plot(t,x(:,2),'LineWidth',2)
grid on
hold on
yline(0,'r--')
xlabel('t')
ylabel("y'(t)")
title("Grafico de y'(t)")

%b) graficar la sol y obtener el valor de variable de estado y en t=2.5 con 6 digitos exactos
%como rk4 nos devuelve una aproximacion de una serie de nodos
inter=[0 2.5];
tol = 0.5e-6;
L = 20;
[t,x] = rk4(f,inter,x0,L);
y_aux = x(end,1);

while true
    L = 2*L;
    [t,x] = rk4(f,inter,x0,L);
    y_actual = x(end,1);
    err_est = abs(y_actual-y_aux)/15;%la estimacion de error para RK4
    if err_est < tol
        break;
    endif
    y_aux = y_actual;
endwhile

printf("y(2.5)=%.10f\n",y_actual);
printf("Error estimado = %.3e\n",err_est);
printf("L utilizado = %d\n",L);

y = x(:,1);%debo redifinir porq la grafica esta supeditada a los valores que vienen de arriba, digamos, del q viene con tol 1e-6

figure
plot(t,y,'LineWidth',2)
hold on
plot(2.5,y_actual,'ro','MarkerSize',8)
grid on
xlabel('t')
ylabel('y(t)')
title('Solucion del PVI')
legend('y(t)','y(2.5)')
