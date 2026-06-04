addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%defino los datos de la tabla
x=[-1 1 2 3 4]';
y=[0.23 0.25 0.26 0.14 0.06]';

%ahora debo transformar el sistema a uno linea, para ello:
z=1./y;
%armo la matriz
M=[exp(x) x ones(size(x))];
%construyo ec normales
K=M'*M;
rhs=M'*z;

%resuelvo usando gauslupp
%coef=GaussLUPP(K,rhs);
coef=K\rhs;
A=coef(1);
B=coef(2);
C=coef(3);

%ahora tengoq  recuperar los parametros originales
a=7.5/C;
b=A*a;
c=B*a;

printf("los parametros de ajuste son: \n");
fprintf('a = %.10f\n',a)
fprintf('b = %.10f\n',b)
fprintf('c = %.10f\n\n',c)

%printf("\n--- INCISO B: Interpolacion por Spline Cubico ---\n");
% 1. Obtenemos los coeficientes llamando a tu función [cite: 225, 227]
%[A_sp, B_sp, C_sp, D_sp] = cubic_spline_natural(x, y);

% 2. Queremos evaluar en x = 0. 
% El x=0 cae en el primer subintervalo, que va de x(1)=-1 a x(2)=1.
% Por lo tanto, usamos los coeficientes del índice 1 (A_sp(1), B_sp(1), etc.)
%dx = 0 - x(1);  % El término (x - x_j) del polinomio [cite: 163]

%y_spline = A_sp(1) + B_sp(1)*dx + C_sp(1)*dx^2 + D_sp(1)*dx^3;
%printf("y(0) con spline = %.7g\n", y_spline);

% evalúo el modelo ajustado en x=0
y_mc = a/(b*exp(0)+c*0+7.5);

fprintf('y(0) por minimos cuadrados = %.10f\n\n',y_mc)

% calculo el spline cubico natural
[a_s,b_s,c_s,d_s] = cubic_spline_natural(x',y');

% evalúo el spline en x=0
y_spline = spline_eval(0,x,a_s,b_s,c_s,d_s);

fprintf('y(0) por spline cubico = %.7f\n\n',y_spline);

% valor exacto dado por la consigna
y_exacto = 0.23;

% calculo error relativo del ajuste por minimos cuadrados
err_mc = abs(y_exacto-y_mc)/abs(y_exacto);

% calculo error relativo del spline
err_spline = abs(y_exacto-y_spline)/abs(y_exacto);

fprintf('ERROR RELATIVO MINIMOS CUADRADOS\n');
fprintf('%.10f\n\n',err_mc);
fprintf('ERROR RELATIVO SPLINE CUBICO\n');
fprintf('%.10f\n',err_spline);