addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#defino la funcion
pt=3.5;
k=0.04;
tol=1e-9;
kmax=100;
f = @(x) ((x./(1-x)).*sqrt((2*pt)./(2+x))) - k;

%Grafica
%t=linspace(-1.99,6,200);
%plot(t,f(t), '-r');
%hold on;
  %eje x%
%y = @(t) t.*0;
%grid on;
%plot(t,y(t),'-k');
%pause(10);

#para mostrarlo con 8 cifras decimales exactas hago:
[x1,h1]=biseccion(f,-0.5,0.5,tol,kmax);
fprintf('El valor de x1 es: %.8f\n', x1);
[x2,h2]=secante(f,-0.5,0.5,tol,kmax);
fprintf('el valor de x es: %.8f\n',x2);

###############################################
#parte 2: determinar la presion total de la mezcla necesaria para disociar una fraccion molar
#x=0.02 (con dos decimales exactos.)
x=0.02;
g = @(pt) ((x./(1-x)).*sqrt((2*pt)./(2+x))) - k;

[x2,h2]=biseccion(g,0,10,tol,kmax);
fprintf('el valor de pt es: %.2f\n',x2);
