addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
m  = 68.1;
cd = 0.25;
g  = 9.81;
a=0;
b=10;
%como me dan la funcion de velocidad, si lo integro obtengo la funcion de posicion
v = @(t) sqrt(g*m/cd).*tanh(sqrt(g*cd/m).*t);
x10 = intNCcompuesta(v,a,b,1000,3);
fprintf('pos(10) = %.7f\n',x10);
%334.178167
 
%b)
%ahora debo calcular usando la integral exacta
I_exacta=integral(v,0,5);

% trapecio compuesto con 5 subintervalos
L=5; %nro sub int
t_trap = linspace(0,5,L+1);     % L+1 nodos 
y_trap = v(t_trap);%evaluo para calcular y pasarsela a la funcion
I_trap = trapcomp(t_trap,y_trap);

% gauss compuesto 
I_gauss = cuad_gauss_c(v,0,5,5,2);

% errores absolutos
error_trap = abs(I_trap - I_exacta);
error_gauss = abs(I_gauss - I_exacta);
% errores relativos
rel_trap = error_trap/abs(I_exacta);
rel_gauss = error_gauss/abs(I_exacta);
% cifras exactas
cifras_trap = -log10(rel_trap);
cifras_gauss = -log10(rel_gauss);

fprintf('cifras exactas trapecio= %.5f\n',cifras_trap);
fprintf('cifras exactas gauss= %.5f\n',cifras_gauss);
%cifras exactas trapecio= 2.38091
%cifras exactas gauss= 5.70365
%como son cifras exactas, reporto para trap=2 y para gauss=5 (osea trunque los resultados)