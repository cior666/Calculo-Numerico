#Use el metodo de Newton para aproximar, con una exactitud de 10−4, el
#valor de x que en la grafica de y = x2 produce el punto mas cercano a (1,0). Ayuda: Reduzca al
#mınimo [d(x)]2 donde d es la funcion distancia de la grafica al punto.
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');

tol=1e-4;
kmax=100;
#despejando en la hoja nos damos cuenta que como tenemos que minimizar la distancia
#utilizamos la formula de distancia y reemplazamos por los valores que tenemos para centrarla
#y reemplazamos y=x^2
f=@(x)x.^4+x.^2-2.*x+1;
#df pasa a ser mi funcion a los fines de la resolucion porq es la distancia. Esto quiere decir que este seria mi f de newton.
df=@(x)4.*x.^3+2.*x-2;
#encuentro ddf como la derivada de la derivada de f. Esto quiere decir que este seria mi df de newton.
ddf=@(x)12.*x^2+2;
x=linspace(0,2,50);
funcion=4.*x.^3+2.*x-2;

figure;
hold on;
plot(x, funcion, 'm-', 'linewidth', 1.5);
grid on;
grid minor;
pause(10);

[x0,h0]=biseccion(df,0,1,tol,kmax);
fprintf('el metodo de biseccion converge a: %f\n',x0);

[x1,h1]=newton(df,ddf,0.5,tol,kmax);
fprintf('el metodo de newton converge a: %f\n',x1);
fprintf('lo hace en it: %f\n',length(h1)-1);