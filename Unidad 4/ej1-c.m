#Obtenga una cota para el numero de iteraciones que se requieren para alcanzar una aproximacion con una 
#exactitud de 10−3 a la soluci´on de x3 + x − 4 = 0 que se encuentra en el intervalo [1,4]. 
#Obtenga una aproximacion de la raız con esta exactitud mediante el metodo de la biseccion.

y=@(x)x^3+x-4;
intervalo=[1,4];

#en el apunte se muestra que para hallar el numero de iteraciones que se requieren para quedar con una
#exactitud de 10^-3 hay que usar la formula
#n=log2(|b-a|/tol) entonces:
n=log2(abs(4-1)/(10^-3));
disp('el nro de iteraciones para esa tolerancia es: ');
disp(ceil(n)); #se usa ceil para redonedar al nro mas alto, porq sino da 11.53 y no se pueden hacer
#.53 iteraciones.
