addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#la funcion punto fijo recibe:
#g que es la funcion matematica de iteracion
#x0 que es la abcisa o estimacion inicial, es el P0.
#kmax es el nro maximo de iteraciones permitidas
#tol es la tolerancia

#y retorna
#x que es el valor de la solucion final aproximada
#h que es el vector que guarda el historial de convergencia.
#podemos pensar a la longitud de h-1 como la cantidad de iteraciones necesarias para que converga.

#tenemos que p0 es 1.5 y tol 1e-3
g1 = @(x) 0.5 * sqrt(10 - x^3);
g2=@(x)sqrt(10/(4+x));
x0=1.5;
tol=1e-3;

#ahora ejecuto para g1
[x1,h1]=puntofijo(g1,x0,tol,1000);
fprintf('g1 convergió a x = %.6f en %d iteraciones.\n', x1, length(h1)-1);

#ahora para g2
[x2,h2]=puntofijo(g2,x0,tol,1000);
fprintf('g2 convergió a x = %.6f en %d iteraciones.\n', x2, length(h2)-1);
