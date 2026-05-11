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