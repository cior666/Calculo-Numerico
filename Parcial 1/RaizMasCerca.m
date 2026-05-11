addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#hallar la raiz mas cercana a 8 de la funcion con 10 digitos correctos.
tol=5e-10;
f=@(x) sin(x)+cos(1+x.^2)-1;
df=@(x) cos(x) - 2 .* x .* sin(x.^2 + 1);
x=linspace(0,10,2000);
funcion=sin(x)+cos(1+x.^2)-1;
kmax=100;

%figure;
%hold on;
%plot(x, funcion, 'm-', 'linewidth', 1.5);
%grid on;
%grid minor;
%hold off; 
%pause(10);

#viendo la grafica entre 7 y 9 vemos que entre 7.5 y 8.5 esta la mas cercana visualmente
#entonces acotamos los intervalos entre esos valores para hallar la mas cercana, 
#vamos a tomar de 7.5 a 8 y de 8 a 8.5
[x0,h0]=biseccion(f,7.9,8,tol,kmax);
fprintf('la raiz en el primer intervalo es: %.10f\n',x0);
[x2,h2]=newton(f,df,7.9,tol,kmax);
fprintf('la raiz en el primer intervalo con newton es: %.10f\n',x2);

#en otro ejercicio pide calcular el valor maximo mas cercano a 8.
#sabemos que cuando la 2da derivada sea 0 habra un maximo en ese pto
#entonces derivamos la derivada y usamos a la derivada como la funcion.
ddf = @(x) -sin(x) - 2.*sin(x.^2 + 1) - 4.*(x.^2).*cos(x.^2 + 1); 
[x_max_newton, h_newton] = newton(df, ddf, 7.9, tol, kmax);
valor_maximo = f(x_max_newton);
fprintf('El valor maximo de f(x) con 7 decimales es: %.7f\n', valor_maximo);
#El valor maximo de f(x) con 7 decimales es: 0.9999565

[x1,h1]=biseccion(f,8.1,8.2,tol,kmax);
fprintf('la raiz en el 2do intervalo es: %.10f\n',x1);
[x3,h3]=newton(f,df,8.1,tol,kmax);
fprintf('la raiz en el 2do intervalo con newton es: %.10f\n',x3);

#El comodín %.10f no le dice a Octave que imprima 10 cifras significativas, 
#le exige que imprima obligatoriamente 10 posiciones decimales después de la coma. Entonces como yo ya tengo una cifra que
#es la parte entera, tengo que imprimir 9 posiciones decimales. 
#Como ya sabemos la rta, si lo hacemos con %.9f\n nos redondea a 643 y sabemos que la rta es 642.
#entonces, lo que voy a hacer es imprimir numeros de mas y truncar a ojo.
#la x del primer intervalo es: 7.962210642
#la x del sdo intervalo es: 8.160319512

#viendo la dif entre estas podemos observar que la del primer intervalo es la mas cercana a 8.