x=[0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0];
y=[4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%defino a phi0=1
%phi1 cos(pix/2)
%phi2 cos^2(pix/2)

% funciones base 
g0 = @(x) ones(size(x));
g1 = @(x) cos(pi.*x./2);
g2 = @(x) cos(pi.*x./2).^2;

%ahora q las tengo definida las evaluo para los valores de x que me dan:
phi0=g0(x);
phi1=g1(x);
phi2=g2(x);

%asi puedo armar la matriz
A = [sum(phi0.*phi0)  sum(phi0.*phi1)  sum(phi0.*phi2); sum(phi1.*phi0)  sum(phi1.*phi1)  sum(phi1.*phi2);
sum(phi2.*phi0)  sum(phi2.*phi1)  sum(phi2.*phi2)];

% y el vector independiente
b = [sum(y.*phi0);sum(y.*phi1);sum(y.*phi2)];

%como tengo A y b puedo usar un metodo de los trabajados en la unidad de seal
% hago gauss_p
[a,r] = gauss_p(A,b);
% extraigo los coef a0 a1 y a2
a0 = a(1);
a1 = a(2);
a2 = a(3);

%el error del ajuste siempre compara: dato experimental vs modelo ajustado
% b) para la parte b como tengo que hallar el error de ajuste para x=1 con 4 decimales:
f=@(x) a0+a1.*cos(pi.*x./2)+a2.*cos(pi.*x./2).^2;
x0=1;
%el y real viene de la tabla, entonces para x=1 y=5.33
y_real=5.33;
y_aprox=f(x0);
error_x1 = abs(y_real - y_aprox);

% resultados
printf('a0 = %.2f\n',a0);
printf('a1 = %.2f\n',a1);
printf('a2 = %.2f\n',a2);
printf('\n');
printf('error para x=1 = %.4f\n',error_x1);