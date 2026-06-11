% Alumno: Ciorciari Conrado || DNI: 43426610
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%a) La longitud de la elipse 9x^2+16y^2=144
%para despejar se que la formula teorica digamosle de una elipse es x^2/a^2+y^2/b^2=1 entonces divido la q me dan por 144
% y obtengo x^2/16 + y^2/9=1 por lo q a=4 y b=3 

%Ayuda: La parametrización de la elipse es α(t)=(acos(t),bsin(t))donde ay b son los semiejes de la elipse
%entonces a(t)=(4cos(t),3sin(3t)) si parametrizo se que la elipse va de 0 a 2pi
%las derivadas de x e y son x'=-4sin(t) y y'=3cos(t), entonces reemplazando en la norma obtengo la expresion:
g = @(t) sqrt(16*sin(t).^2 + 9*cos(t).^2);
a=0;
b=2*pi;
n=3;
L=1;
for k=1:8
    I = cuad_gauss_c(g,a,b,L,n);
    printf("%4d   %.12f\n",L,I);
    L=L*2;
endfor

% los valores obtenidos son: 
%  1   20.450032624175
%  2   22.120688197866
%  4   22.105627731996
%  8   22.103508060351
%  16   22.103492162933
%  32   22.103492160709
%  64   22.103492160709
% 128   22.103492160710

%como pide el valor con 10 cifras significativas reporto: 22.1034921607 

%b)
n2=2;
L2=3;
%DEBO CALCULAR CON L3=6 Y COMPARAR LOS VALORES
I_L3 = cuad_gauss_c(g,a,b,L2,n2);

%doblo L2 para comparar
L3=6;
I_L6=cuad_gauss_c(g,a,b,L3,n2);

%hago el calculo de cifras:
R = abs(I_L6-I_L3)/abs(I_L6);
t = floor(-log10(R));
fprintf("IL3 = %.6f\n",I_L3);
fprintf("IL6 = %.6f\n",I_L6);
printf("cifras exactas = %d\n",t);







