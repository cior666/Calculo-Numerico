% Alumno: Ciorciari Conrado || DNI: 43426610
datos=load('datos2.txt');
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% a)
%cargo los datos
y = datos;
t = (1:length(y))';
% la funcion es: f(t)=at+b+csin(π6t)+dcos(π6t),
%armo la matriz
A = [t,ones(length(t),1),sin(pi*t/6),cos(pi*t/6)];
%como ya tengo la matriz, A puedo armar las ecs normales
M = A'*A;
b = A'*y;

%al tener ahora la matriz M y el vector b puedo llamar a algun metodo que resuelva la ec, uso gauss_p
[x,r] = gauss_p(M,b);
a = x(1);
b0 = x(2);
c = x(3);
d = x(4);
%printeo los resultados con 5 cifras decimales 
printf('a = %.5f\n',a);
printf('b = %.5f\n',b0);
printf('c = %.5f\n',c);
printf('d = %.5f\n',d);
%RESULTADO: 
%a = -0.06639 REPORTO: -0.0664
%b = 20.49822 REPORTO: 20.4982
%c = 2.85393  REPORTO: 2.8539
%d = 5.28337 REPORTO: 5.2834

%b)
%como tengo ya los coeficientes puedo armar la funcion 
f = @(t) a.*t + b0 + c.*sin(pi.*t./6) + d.*cos(pi.*t./6);

% valores ajustados
y_aprox = f(t);
% error cuadratico absoluto
errabs = sum((y - y_aprox).^2);
fprintf('error cuadratico abs = %.7f\n',errabs);
%RESULTADO: 4.2265299 REPORTO: 4.2265

%c)
%para saber la temp en enero del 2020 tengo que encontrar el valor de f en t=13 (el primer mes del anio proximo seria el mes 13 de la tabla)
t2020= f(13);
%imprimo el resultado con mas cifras y luego redondeo
fprintf("temperatura enero 2020 = %.3f\n",t2020);
%RESULTADO: 25.638 REPORTO: 25.6
t_exacta=27.8;
er = abs(t_exacta - t2020)/abs(t_exacta);
%imprimo con mas cifras y luego redondeo    
fprintf("error relativo = %.6f\n",er);
%RESULTADO: 0.077784 REPORTO: 0.0778 (4 decimales)