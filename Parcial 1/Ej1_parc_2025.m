addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f = @(x) log(x.^2 + 1) - exp(x./2) .* cos(pi.*x) - 1.106;
x=linspace(0, 1,500);
funcion=log(x.^2 + 1) - exp(x./2) .* cos(pi.*x) - 1.106;

%figure;
%hold on;
%plot(x, funcion, 'm-', 'linewidth', 1.5);
%grid on;
%grid minor;
%hold off; 
%pause(10);

#para contar la cantidad de raices que tenemos podemos contar los cambios de signo que va
#teniendo la funcion en el intervalo, es decir si pasa de positivo y luego a negativo
#contaria como 1, entonces: 

f_int=f(x);
cambia_signo=f_int(1:end-1).*f_int(2:end); #teorema valor medio 
raices=sum(cambia_signo<0);
fprintf('hay : %f\n ',raices);
#segun el algoritmo hay 7 raices, visualmente comprobe lo mismo.


#hallar la raiz mas cercana a -1, con un error absoluto menor a 10^-7 usando biseccion
#tomando como extremos del intervalo inicial los enteros mas cercanos. Especificar dichos
#valores y la cantidad de iteraciones requeridas para alcanzar la precision deseada.
tol=1e-7;
kmax=100;
#al pedirme la raiz mas cercana a -1 yo acote la grafica de -2 a 0 (osea -1 para abajo y +1 para arriba)
#ahi veo que hay dos raices "cercanas" a -1. Entonces ahora aplico biseccion para los dos intervalos para ver cual realmente
#esta mas cerca
[x0,h0]=biseccion(f,-2,-1,tol,kmax);
fprintf('la raiz de -2 a -1 esta en: %f\n',x0);
iteraciones1=ceil(log2(abs(-1-(-2))/tol));
fprintf('la cantidad de iteraciones necesarias para el 1er intervalo fueron: %f\n',iteraciones1);
[x1,h1]=biseccion(f,-1,0,tol,kmax);
fprintf('la raiz de -1 a 0 esta en: %f\n',x1);
iteraciones2=ceil(log2(abs(0-(-1))/tol));
fprintf('la cantidad de iteraciones necesarias para el 2do intervalo fueron: %f\n',iteraciones2);

#al ver los resultados, en el intervalo [-2,-1] el algoritmo no encontro raiz, entonces retorno el valor del extremo derecho (-1)
#en el intervalo [-1,0] la raiz esta en -0,837826 por lo q es la mas cercana a 1.


#usar newton con tol 10^-10 empezando en 3, 3.05 y 3.1 respectivamente. Determinar los valores obtenidos y especificar el orden
#de convergencia en cada caso.
tol2=1e-10;
df=@(x) pi .* exp(x ./ 2) * sin(pi .* x) - (exp(x ./ 2) .* cos(pi .* x)) ./ 2 + (2 .* x) ./ (x.^2 + 1);
[x3,h3]=newton(f,df,3,tol2,kmax);
fprintf('por newton empezando de x=3 converge a: %.10f\n',x3);
#valor obtenido: 0.6746660956
[x4,h4]=newton(f,df,3.05,tol2,kmax);
fprintf(' por newton empezando de x=3.05 converge a: %.10f\n',x4);
#valor obtenido:  -0.8378265061
[x5,h5]=newton(f,df,3.10,tol2,kmax);
fprintf(' por newton empezando de x=3.10 converge a: %.10f\n',x5);
#valor obtenido: 6.4666706700



#ahora tengo que encontrar el punto fijo mas cercano a x=1 considerando 7 cifras exactas.
#un punto fijo es la intersección exacta entre la curva de una función y=g(x) y la recta identidad y=x
t = linspace(0, 1.5, 200);
% 2. Definimos tu función original f(t) y la recta identidad
f = @(t) log(t.^2 + 1) - exp(t./2) .* cos(pi.*t) - 1.106;
y_idem = @(t) t;
% 3. El código gráfico de tu compañero corregido
figure;
plot(t, y_idem(t), 'b-', t, f(t), 'r-', 'linewidth', 1.5);
axis([0 1.5 -1 1.5]);
grid on;
legend('Recta Identidad y=x', 'Curva f(x)', 'location', 'northwest');
pause(15);
f_pf= @(x) log(x.^2 + 1) - exp(x./2) .* cos(pi.*x) - 1.106-x;
[x6,h6]=secante(f_pf,0.8,1,1e-7,kmax);
fprintf('el pto fijo esta en: %.7f\n',x6);
#el pto fijo esta en: 0.8679355

