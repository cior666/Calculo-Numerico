
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');

% definimos la funcion como [p q r]
f=@(x) [-2./x, 2./x.^2, sin(log(x))./x.^2];
% intervalo
inter=[1 2];

% condiciones de borde
yc=[1 2];

%% h = 0.1
h1=0.1;
L1=(inter(2)-inter(1))/h1;

[x1,y1]=dif_fin_dir(f,inter,yc,L1);
%% h = 0.01
h2=0.01;
L2=(inter(2)-inter(1))/h2;

[x2,y2]=dif_fin_dir(f,inter,yc,L2);

%% solucion exacta
c2=(8-12*sin(log(2))-4*cos(log(2)))/70;
c1=11/10-c2;
yexacta=@(x) c1.*x + c2./x.^2 - (3/10).*sin(log(x)) - (1/10).*cos(log(x));

%% errores
ye1=yexacta(x1);
ye2=yexacta(x2);

err1=abs(ye1-y1);
err2=abs(ye2-y2);

E1=max(err1);
E2=max(err2);

%% orden empirico
p=log(E1/E2)/log(h1/h2);

%% resultados
printf("\n=========================================\n");
printf("METODO DE DIFERENCIAS FINITAS\n");
printf("=========================================\n");

printf("Subintervalos (h=0.1)  : %d\n",L1);
printf("Subintervalos (h=0.01) : %d\n\n",L2);

printf("Error maximo h = %.2f  : %.12e\n",h1,E1);
printf("Error maximo h = %.2f : %.12e\n",h2,E2);

printf("\nOrden empirico : %.6f\n",p);

%% graficos

figure
plot(x2,y2,'b-o','linewidth',1.5)
hold on
plot(x2,ye2,'r--','linewidth',2)
grid on
xlabel('x')
ylabel('y')
title('Metodo de diferencias finitas')
legend('Dif. Finitas','Solucion exacta','location','best')

%% comparacion con disparo lineal
% completar estos valores con los obtenidos en el ejercicio 2

E_disparo1 = NaN;
E_disparo2 = NaN;

printf("\n=========================================\n");
printf("COMPARACION CON DISPARO LINEAL\n");
printf("=========================================\n");

printf("%-25s %-18s %-18s\n","Metodo","Error h=0.1","Error h=0.01");
printf("---------------------------------------------------------------------\n");
printf("%-25s %.12e %.12e\n","Disparo lineal",E_disparo1,E_disparo2);
printf("%-25s %.12e %.12e\n","Dif. finitas",E1,E2);

if (~isnan(E_disparo1))
    if (E1 < E_disparo1)
        printf("\nPara h=0.1 diferencias finitas presenta menor error.\n");
    elseif (E1 > E_disparo1)
        printf("\nPara h=0.1 disparo lineal presenta menor error.\n");
    else
        printf("\nPara h=0.1 ambos presentan el mismo error.\n");
    endif
endif

if (~isnan(E_disparo2))
    if (E2 < E_disparo2)
        printf("Para h=0.01 diferencias finitas presenta menor error.\n");
    elseif (E2 > E_disparo2)
        printf("Para h=0.01 disparo lineal presenta menor error.\n");
    else
        printf("Para h=0.01 ambos presentan el mismo error.\n");
    endif
endif
