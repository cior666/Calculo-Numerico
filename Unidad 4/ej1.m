#Realice cuatro iteraciones con el metodo de la biseccion para obtener una aproximacion a
#una de las raices de la ecuacion f(x) = 3(x + 1)(x − 0.5)(x − 1) en el intervalo [−2,1.5]. ¿A
#cual de las raıces converge el metodo? Luego estime una cota para la precision del resultado obtenido
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#biseccion recibe los parametros:
#f que es la funcion
#xmin que es el extremo inferior del intervalo
#xmax que es el extremo superior del intervalo
#kmax que es el nro maximo de iteraciones
#tol la tolerancia.

#retorna los siguientes parametros:
#x que es el valor de la aproximacion de la raiz.
#h que es el vector que funciona como historial de aproximaciones

y=@(x)3*(x+1)*(x-0.5)*(x-1);
intervalo=[-2,1.5];
x=0;
h=[];
[x,h]=biseccion(y,-2,1.5,4,10^-6);
disp('el valor aproximado de x es: ');
disp(x);
disp('el historial de aproximaciones es: ')
disp(h);

#ahora para hallar la cota del error lo que hago es hacerla por def.
#cota=b-a/2^n donde b es el extremo superior del intervalo y a el inferior. n la cant de iteraciones.
cota=(1.5-(-2))/(2^4);
disp('la cota del error hallada es: ');
disp(cota);