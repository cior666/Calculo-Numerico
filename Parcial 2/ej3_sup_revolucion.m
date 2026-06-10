%la funcion es: f(x)=2.5+xcos(2x) en el intervalo de 0 a 3 para calcular el area de rev debo hallar f'
%entonces derivo y obtengo: f'=cos(2x)-2xsin(2x)
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% funcion
f = @(x) 2.5 + x.*cos(2.*x);
% derivada
df = @(x) cos(2.*x) - 2.*x.*sin(2.*x);
% integrando del area de revolucion
g = @(x) 2.*pi.*f(x).*sqrt(1 + df(x).^2);
% area usando gauss compuesto
L=20; %cant de sub intervalos
n=3; %puntos de gauss
a=0; %extremo inferior de integracion
b=3; %extramo superior de integracion 
%una vez tengo todos los datos llamo a cuad_gauss_c para hallar el area
area_gauss = cuad_gauss_c(g,a,b,L,n);

% valor de referencia
area_ref = integral(g,0,3);

% convertir a string con varios decimales
s1 = sprintf('%.10f',area_gauss);
s2 = sprintf('%.10f',area_ref);
% eliminar el punto decimal
s1(s1=='.') = [];
s2(s2=='.') = [];
% contar cifras coincidentes
cifras = 0;
for i = 1:min(length(s1),length(s2))
    if s1(i) == s2(i)
        cifras = cifras + 1;
    else
        break
    endif
endfor

printf('cifras exactas = %d\n',cifras);
printf("area gauss = %.10f\n",area_gauss);
printf("area referencia = %.10f\n",area_ref);

cifras2 = cifras_exactas_visual(area_gauss,area_ref);
printf('cifras exactas = %d\n',cifras2);

