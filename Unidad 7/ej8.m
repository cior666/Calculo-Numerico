%MODELO PREDADOR-PRESA de Lotka-Volterra
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%tomando la primera ec: x1'=x1(3-0.002x2) si no hubiera x2 => x1'=3x1 es decir, la poblacion crece sola.
%por lo que, esto indica que x1=presa

%tomando la 2da ec: x2'=-x2(0.5-0.0006x1), si no hubiera x1(presas) => x'=-0.5x2, es decir la pob disminuye y se extingue
%entonces x2=depredador.

%la consigna nos pode calcular numericamente una sol donde la pob inicial de la presa es 1600 y la de predadores es 800, t=meses.
%dsp hay q dibujar la sol graficando ambas poblaciones en el tiempo y describir el fenomeno representado 

%me da la libertad de elegir el modelo y el intervalo en el que trabajo
a=0;
b=60;
%tomo 5 anios
intervalo=[a b];
x0=[1600;800];
h=0.01
L=(b-a)/h;
%defino el sistema
f=@(t,x)[ x(1)*(3-0.002*x(2));
-x(2)*(0.5-0.0006*x(1))];
%voy a usar rk4 para resolver
[t,x]=rk4(f,intervalo,x0,L);

%ahora extraigo las poblaciones que quiero, serian x1 y x2
presa=x( :,1);
depredador=x( :,2);

figure
plot(t,presa,'LineWidth',2)
hold on
plot(t,depredador,'LineWidth',2)
grid on
xlabel('Tiempo (meses)')
ylabel('Poblacion')
title('Modelo depredador-presa')
legend('Presa','Depredador')

%Lo normal en Lotka-Volterra es observar oscilaciones:
% 1-Aumentan las presas.
% 2-Hay más alimento.
% 3-Aumentan los depredadores.
% 4-Se consumen muchas presas.
% 5-Las presas disminuyen.
% 6-Los depredadores se quedan sin alimento.
% 7-Los depredadores disminuyen.
% 8-Las presas vuelven a crecer.