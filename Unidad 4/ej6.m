addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
a = 0.401;
b = 42.7e-6;
N = 1000;
T = 300;
p = 3.5e7;
tol = 1e-12;
k = 1.3806503e-23;
kmax=100;
tol=1e-12;
f=@(V) p.*V+a.*(N^2./V)-a.*b.*(N^3./V^2)-p.*N.*b-k.*N.*T;
df=@(V)-(N.^2 .* a .* (V - 2 .* N .* b)) / (V.^3);

%V=linspace(0,0.2,50);
%funcion=p.*V+a.*(N.^2./V)-a.*b.*(N.^3./V.^2)-p.*N.*b-k.*N.*T;
%figure;
%hold on;
%plot( V, funcion, 'm-', 'linewidth', 1.5);
%grid on;
%grid minor;
%pause(15);

#lo que tengo que hacer es ver cuando df es cero.
[x0,h0]=biseccion(f,0,0.05,tol,kmax);
fprintf('el metodo de biseccion converge a: %f\n',x0);

[x1,h1]=newton(f,df,0.03,tol,kmax);
fprintf('el metodo de newton converge a: %f\n',x1);