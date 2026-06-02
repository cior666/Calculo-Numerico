%Ejercicio 4. Considerando que Qn(f,a,b) denota la f´ormula de Newton-Cotes de n puntos en el
%intervalo [a,b].
%(a) Completar los siguientes cuadros y verificar si el error entre b a 
%f(x)dx y Qn(f,a,b) tiende a cero a medida que n crece.

%primero defino las funciones
f1=@(x) sin(pi*x);
f2=@(x) 1./(1+x.^2);

%ahora defino el valor de la integral en el intervalo
I_exacta_1=2/pi; %valor de f1 en su intervalo
I_exacta_2=2*atan(5); %valor de f2 en su intervalo

%se nos sugiere usar intNCompuesta con L=1
L=1;
%L representa el nro de subdivisiones en el intervalo que estamos
%analizando, usando L=1 le estoy dicicendoa  octave que no divida
%el intervalo, forzando a que el algoritmo tode todo el dominio
%de una sola vez e intente ajustar un unico polinomio gigante
%que pase por todos los n ptos al mismo tiempo.

%cuando L>1, es la forma correcta de integrar en la practica,
%al usar un valor grande por ej L=100, el algoritmo dividira 
%el intervalo original en 100 pedacitos diinutos, cada uno
%con una base h=b-a/L. 

%procedemos a armar las tablas
printf('Tabla 1: f(x) = sen(pi*x) en [1]\n');
printf('n \t Error Absoluto\n');
for n = 2:13 %va de 2 a 13 porq asi esta en el ej
  % Calculamos la cuadratura y su error
  Q = intNCcompuesta(f1, 0, 5, L, n);
  err = abs(I_exacta_1 - Q);
  printf('%d \t %.6e\n', n, err);
end

printf('Tabla 2: f(x) = 1/(1+x^2) en [-5, 5]\n');
printf('n \t Error Absoluto\n');
for n = 2:13
  Q = intNCcompuesta(f2, -5, 5, L, n);
  err = abs(I_exacta_2 - Q);
  printf('%d \t %.6e\n', n, err);
end