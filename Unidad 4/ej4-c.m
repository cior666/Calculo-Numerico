f=@(x) sin(x)+cos(1+x.^2)-1;
df=@(x) cos(x) - 2 .* x .* sin(x.^2 + 1);
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');

tol=1e-10;
kmax=100;

x=linspace(0,5,200);
funcion=sin(x)+cos(1+x.^2)-1;

%figure;
%hold on;
%plot(x, funcion, 'm-', 'linewidth', 1.5);
%grid on;
%grid minor;
%pause(15);

#viendo la grafica, podemos determinar que tenemos dos raices en el rango

#ahora aplico los metodos 
#biseccion:
[x1,h1]=biseccion(f,1,2,tol,kmax);
fprintf('el metodo biseccion converge a x1: %f\n',x1);
fprintf('el nro de iteraciones de conv es: %f\n',length(h1)-1);

#para newton
[x2,h2]=newton(f,df,1.8,tol,kmax);
fprintf('el metodo newton converge a x1: %f\n',x2);
fprintf('el nro de it de conv es: %f\n',length(h2)-2);

#para secante
[x3,h3]=secante(f,1,2,tol,kmax);
fprintf('el metodo secante converge a x1: %f\n',x3);
fprintf('el nro de it de conv es: %f\n',length(h3)-1);

############################################################################
#para la 2da x:
[x4,h4]=biseccion(f,2.2,3,tol,kmax);
fprintf('el metodo biseccion converge a x2: %f\n',x4);
fprintf('el nro de it de conv es: %f\n',length(h4)-1);

[x5,h5]=newton(f,df,2.4,tol,kmax);
fprintf('el metodo newton converge a x2: %f\n',x5);
fprintf('el nro de it de conv es: %f\n',length(h5)-1);

[x6,h6]=secante(f,2.2,3,tol,kmax);
fprintf('el metodo secante converge a x2: %f\n',x6);
fprintf('el nro de it de conv es: %f\n',length(h6)-1);
