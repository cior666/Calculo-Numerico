#encontrar el valor positivo del parametro a con un error de 10^-6 tal que la funcion
#z(t)=0.04 .*sqrt(a+t).*(1-t)-t.*sqrt(3a) posea un pto fijo en t=0.02
#ayuda: se sabe que la grafica de la funcion z(t) pasa cerca de w(t)=0.04.*sqrt(19+t).*(1-t)-t.*sqrt(57)

#Un punto fijo se define analíticamente como un valor p tal que g(p)=p
#Por lo tanto, que tu función z(t) posea un punto fijo exactamente en t=0.02 significa que, al evaluar la función en ese instante de tiempo, 
#el resultado debe ser idéntico a ese mismo valor. Matemáticamente: z(0.02)=0.02

#1. Construcción de la función a resolver f(a)=0
#Partimos de la condición del punto fijo y reemplazamos t=0.02: de ahi obtenemos f(a)

#2. ¿Para qué sirve la ayuda de w(t)? (El valor inicial)
#La consigna te da la función w(t)=0.04 19+t​ (1−t)−t 57​
#y te dice que la gráfica pasa muy cerca de z(t). Si comparas w(t) término a término con la fórmula original de z(t), notarás un patrón directo:
#Donde z(t) tiene una a, w(t) tiene un 19.
#Donde z(t) tiene un 3a, w(t) tiene un 57 (y efectivamente, 3×19=57).
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(a) 0.0392.*sqrt(a+0.02)-0.02.*sqrt(3.*a)-0.02;
df = @(a) (0.0196 ./ sqrt(a + 0.02)) - ((0.01 * sqrt(3)) ./ sqrt(a));
tol=1e-6;
kmax=100;

#como nos da un valor inicial cercano, a=19, podemos aplicar newton-raphson
a=linspace(18,20,50);
funcion=0.0392.*sqrt(a+0.02)-0.02.*sqrt(3.*a)-0.02;

%figure;
%hold on;
%plot(a, funcion, 'm-', 'linewidth', 1.5);
%grid on;
%grid minor;
%hold off; % Siempre es buena práctica "apagar" el hold al terminar de graficar
%pause(10);

[x0,h0]=newton(f,df,19,tol,kmax);
fprintf('el valor de a es: %f\n',x0);
#el valor de a es de 19.072954

#ahora pide hallar una raiz para z(t)
z=@(t) 0.04.*sqrt(x0+t).*(1-t)-t.*sqrt(3.*x0);
t=linspace(0,0.1,100);
funcion2=0.04.*sqrt(x0+t).*(1-t)-t.*sqrt(3.*x0);

figure;
hold on;
plot(t, funcion2, 'm-', 'linewidth', 1.5);
grid on;
grid minor;
hold off; % Siempre es buena práctica "apagar" el hold al terminar de graficar
pause(10);
[x1,h1]=biseccion(z,0,0.1,tol,kmax);
fprintf('el valor de t es: %f\n', x1);
#la raiz obtenida es 0.022585