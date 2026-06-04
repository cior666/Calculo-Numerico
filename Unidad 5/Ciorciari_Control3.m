addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% a)
%defino los datos de la tabla
x=[-1 1 2 3 4]';
y=[0.23 0.25 0.26 0.14 0.06]';

%transformo el sistema a uno lineal
z=1./y;
%armo la matriz
M=[exp(x) x ones(size(x))];
%construyo ec normales
K=M'*M;
rhs=M'*z;
%resuelvo el sistema para obtener los coeficientes
coef=K\rhs;
A=coef(1);
B=coef(2);
C=coef(3);
%busco a,b,c a partir de A=b/a, B=c/a y C=7.5/a
a=7.5/C;
b=A*a;
c=B*a;
printf("los parametros de ajuste son: \n");
%muestro mas cifras que las necesarias para asegurar
fprintf('a = %.8f\n',a)
fprintf('b = %.8f\n',b)
fprintf('c = %.8f\n\n',c)

% b)
% calculo el spline cubico natural
[a_s,b_s,c_s,d_s] = cubic_spline_natural(x',y');
% evalúo el spline en x=0
y_spline = spline_eval(0,x,a_s,b_s,c_s,d_s);
printf('y(0) por spline cubico = %.7f\n\n',y_spline);

% c)
% evaluo el modelo ajustado en x=0
y=0.23;
y_mc = a/(b*exp(0)+c*0+7.5);
% calculo error relativo del ajuste por minimos cuadrados
err_mc = abs(y-y_mc)/abs(y);
% calculo error relativo del spline
err_spline = abs(y-y_spline)/abs(y);
fprintf('error relativo minimos cuadrados \n');
fprintf('%.6f\n\n',err_mc);
fprintf('error relativo spline cubico\n');
fprintf('%.6f\n',err_spline);
