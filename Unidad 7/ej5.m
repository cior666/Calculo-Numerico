%pide usar RK4 y el esquema predictor-corrector de adams de cuarto orden p resolver
%el pvi del ej 4.
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(t,y) t*exp(3*t)-2*y;
a=0;
b=1;
inter=[a b];
y0=0;
h_vals=[0.2, 0.1, 0.05];
y_exacta=1.*exp(3.*1)/5-exp(3.*1)/25+exp(-2.*1)/25;
printf(" h\t| Valor aprox RK4\t| Valor aprox Adams\t| Error RK4\t| Error Adams\n");
printf("=========================================================================================\n");

% 2. Bucle principal
for i = 1:length(h_vals)
    h = h_vals(i);
    L = (inter(2) - inter(1)) / h; % Calculo cantidad de subintervalos
    
    % resuelvo el PVI
    [~, y_rk4]   = rk4(f, inter, y0, L);
    [~, y_adams] = adams_bashfort(f, inter, y0, L); 
    
    % extraigo el valor aproximado en el instante final t=1
    val_rk4 = y_rk4(end);
    val_adams = y_adams(end);
    
    % calculo los errores
    err_rk4   = abs(y_exacta - val_rk4);
    err_adams = abs(y_exacta - val_adams);
    
    % Imprimo los resultados mostrando primero la resolucion y luego la comparacion
    printf("%.2f\t| %.6f\t\t| %.6f\t\t| %.6e\t| %.6e\n", h, val_rk4, val_adams, err_rk4, err_adams);
endfor


% === EJECUCION PARA LOS METODOS DE LA CONSIGNA ===

% a) Euler hacia atras: y_{n+1} = y_n + h*f_{n+1} 
% p=0 | a_0=1 | b_{-1}=1, b_0=0
a_ea = [1];
b_ea = [1];
analizar_metodo("Euler hacia atras", a_ea, b_ea);

% b) Crank-Nicholson: y_{n+1} = y_n + h/2*(f_{n+1} + f_n) 
% p=0 | a_0=1 | b_{-1}=0.5, b_0=0.5
a_cn = [1];
b_cn = [0.5, 0.5];
analizar_metodo("Crank-Nicholson", a_cn, b_cn);

% c) Adams-Bashforth (2 pasos): p=1
a_ab = [1 0];
b_ab = [0 3/2 -1/2];
analizar_metodo("Adams-Bashforth (2 pasos)", a_ab, b_ab);

% d) Adams-Moulton (2 pasos): p=1
a_am = [1 0];
b_am = [5/12 8/12 -1/12];
analizar_metodo("Adams-Moulton (2 pasos)", a_am, b_am);
