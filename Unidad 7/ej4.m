%pide analziar el comportamiento del error para los metodos de euler hacia 
%adelante y hacia atras y para Crank-Nicholson cuando resolvemos el sgte pvi
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(t,y) t*exp(3*t)-2*y;
a=0;
b=1;
inter=[a b];
y0=0;
h_vals=[0.2, 0.1, 0.05];
%calculo la y exacta para t=1 q es el final.
y_exacta=1.*exp(3.*1)/5-exp(3.*1)/25+exp(-2.*1)/25;
%los metodos me piden que yo calculce df/dy es decir derivada de f
%parcial respeccto de y, esto me da como resultado
dfdy=@(t,y) -2;
% Vectores para almacenar los errores absolutos en t=1
err_e  = zeros(1, 3);
err_ea = zeros(1, 3);
err_cn = zeros(1, 3);
printf(" h\t| Err Euler Adel.\t| Err Euler Atras\t| Err Crank-Nicholson\n");
printf("====================================================================\n");
%ahora tengo que hacer el bucle para hacer los calculos pertinentes
for i=1:length(h_vals)
    h=h_vals(i);
    L=(b-a)/h;
    %ahora hago la llamada a los algoritmos:
    [~,y_e]=euler(f,inter,y0,L);
    [~,y_ea]=euler_atras(f,dfdy,a,b,y0,L);
    [~,y_cn]=CN_newton(f,dfdy,a,b,y0,L);
    %ahora que tengo los valores de y puedo hallar el error abosluto
    %al final del intervalo
    err_e(i)=abs(y_exacta-y_e(end));
    err_ea(i)=abs(y_exacta-y_ea(end));
    err_cn(i)=abs(y_exacta-y_cn(end));
    printf("%.2f\t| %.6e\t\t| %.6e\t\t| %.6e\n", h, err_e(i), err_ea(i), err_cn(i));
endfor
printf(" CALCULO DEL ORDEN EMPIRICO: log2( E(h) / E(h/2) )\n");
printf("====================================================================\n");
printf("Reduccion\t| Ord Euler Adel.\t| Ord Euler Atras\t| Ord Crank-Nicholson\n");
printf("--------------------------------------------------------------------\n");

% 4. Calculo de orden empirico (Comparacion de errores sucesivos)
for i = 1:2
    % Como h se reduce exactamente a la mitad (0.2 -> 0.1 -> 0.05),
    % el orden p es log2 del cociente de errores.
    ord_e  = log2(err_e(i) / err_e(i+1));
    ord_ea = log2(err_ea(i) / err_ea(i+1));
    ord_cn = log2(err_cn(i) / err_cn(i+1));
    
    printf("h=%.2f a h=%.2f\t| %.4f \t\t| %.4f \t\t| %.4f\n", h_vals(i), h_vals(i+1), ord_e, ord_ea, ord_cn);
endfor
