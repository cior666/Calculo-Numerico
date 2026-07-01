%barra homogenea de longitud L=3 y conductividad termica k=1. 
%temp extremo izq=21 f(0)=21
%extramo derecho se encuentra aislado  
% por ley de Fourier q=-k.dT/dx como el flujo es cero entonces
% 0=-kdT/dx-----> dT/dx=0 como el extremo derecho se encuentra en x=3
% entonces T'(3)=0
%se sabe q sobre la barra actua una fuente f(x)=20 sin (5(x-1))
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% a) determinar con dos digitos decimales exactos la temp en el extremo derecho de la barra. Explicar como lo hizo
% b) Estime en q punto de la barra de temp es maxima y que valor de temperatura alcanza en dicho punto.

f=@(x) [zeros(length(x),1), zeros(length(x),1),-20*sin(5*(x-1))];

% intervalo de la barra
Lbarra=3;
inter=[0 Lbarra];

% condicion de dirichlet
% T(0)=21
ycd=21;

% condicion de robin
% T'(3)=0
% A*y'(3)+B*y(3)=C
rob=[1 0 0];

n=20;

printf("===========================================\n");
printf(" refinamiento de la malla\n");
printf("===========================================\n");
printf(" subintervalos      T(3)\n");
printf("-------------------------------------------\n");

for k=1:10

    [x,y]=dif_fin_rob(f,inter,ycd,rob,n);

    printf("%8d        %.10f\n",n,y(end));

    n=2*n;

end
%----------------------------------------------------
% solucion final (la mas refinada)
%----------------------------------------------------

n=N(end);

[x,y]=dif_fin_rob(f,inter,ycd,rob,n);

% temperatura en el extremo derecho
Text=y(end);

% temperatura maxima
[Tmax,pos]=max(y);
xmax=x(pos);

printf("\n===========================================\n");
printf(" resultados finales\n");
printf("===========================================\n");

printf("temperatura en x=3      = %.10f\n",Text);
printf("temperatura maxima      = %.10f\n",Tmax);
printf("posicion del maximo     = %.10f\n",xmax);

% grafico

figure
plot(x,y,'b-o','linewidth',1.5)

grid on
xlabel('x')
ylabel('Temperatura')
title('Distribucion de temperatura en la barra')