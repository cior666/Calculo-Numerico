t = linspace(0,2*pi,8);
x1 = 6*cos(t)-3*cos(2*t);
x2 = 6*sin(t)-3*sin(2*t);
dx1 = @(t) -6*sin(t)+6*sin(2*t);
dx2 = @(t) 6*cos(t)-6*cos(2*t);
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
df1_x1 = dx1(0);
df2_x1 = dx1(2*pi);

df1_x2 = dx2(0);
df2_x2 = dx2(2*pi);

[S1,dS1,ddS1] = funcion_spline(t,x1,df1_x1,df2_x1);
[S2,dS2,ddS2] = funcion_spline(t,x2,df1_x2,df2_x2);
t0=4;
vx=dS1(t0);
vy=dS2(t0);
velocidad=sqrt(vx^2+vy^2);
fprintf("velocidad= %.7f\n",velocidad);

% velocidad exacta
v_exacta = sqrt(dx1(t0)^2 + dx2(t0)^2);
% error absoluto
error_abs = abs(v_exacta - velocidad);
fprintf("error = %.7f\n",error_abs);
%como el error es 0.0713, 2do decimal es la ult cifra confiable.
%RESULTADO:
%error = 0.0713000 la rta correcta es: 0.071