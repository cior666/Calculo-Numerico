#definimos la funcion como [p q r]
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(x) [-2./x,2./x.^2,sin(log(x))./x.^2];
%intervalo
inter=[1 2];
%cond de borde
yc=[1 2];
%cantidad de subintervalos, la consigna dice h=0.1 y como h=b-a/L
%L=b-a/h
h1=0.1;
L=(2-1)/0.1;
[x1,y1]=disparo_lineal(f,inter,yc,L);
%en x tenemos los nodos donde se calculo la solucion
%en y tenemos la solucion aproximada del pvc evaluada en esos nodos
%ahora con h=0.01
L2=(2-1)/0.01;
h2=0.01;
[x2,y2]=disparo_lineal(f,inter,yc,L2);

%ahora nos pide hallar el error, y nos da c2 y c1
%con ello encuentro la sol exacta y luego calc el error
c2=(8-12*sin(log(2))-4*cos(log(2)))/70;
c1=11/10-c2;
yexacta=@(x) c1.*x + c2./x.^2 -(3/10)*sin(log(x)) -(1/10)*cos(log(x));

%hallo yexacta1 e yexacta2
ye1=yexacta(x1);
ye2=yexacta(x2);
%ahora los errores
E1=max(abs(ye1-y1));
E2=max(abs(ye2-y2));

%finalmente nos pide el orden empirico, eso se calcula
%como: p=log(E1/E2)/log(h1/h2)
p=log(E1/E2)/log(h1/h2);
% grafico
figure
plot(x2,y2,'b','linewidth',2)
hold on
plot(x2,ye2,'r--','linewidth',2)
grid on
legend("Disparo","Exacta")
printf("\n==============================\n");
printf("Resultados del ejercicio\n");
printf("==============================\n");

printf("Error maximo para h = %.2f : %.12e\n",h1,E1);
printf("Error maximo para h = %.2f : %.12e\n",h2,E2);

printf("\nOrden empirico = %.6f\n",p);