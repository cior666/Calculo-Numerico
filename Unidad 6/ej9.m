addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%primero debo definir la funcion
f=@(x) x.^2 .*exp(-x);
%los extremos de integracion
a=0;
b=1;
L=1;

%el valor de referencia o el I exacto lo saco usando la funcion de octave (podria hacerlo con la calc)
I_exacta=integral(f,a,b);

%entonces hago la cuadratura de gauss con n=2
n=2;
%la funcion cuad_gauss_c recibe: 
% f q es la funcion a integrar
% a q es el extremo inferior
% b q es el extremo superior
% L q es la cantidad de subintervalos
% n q es la cantidadd de ptos de gauss por subintervalo
I_gauss_2=cuad_gauss_c(f,a,b,L,n);

%y ahora hago la intNCcompuesta, esta recibe
% f funcion a integrar
% a extremo inferior
% b extremo superior
% L cant de subintervalos
% n cant de ptos de newton cotes
% para n=2 corresponde a la regla del trapecio
I_nc_2=intNCcompuesta(f,a,b,L,n);

err_gauss_2=abs(I_exacta-I_gauss_2);
err_nc_2=abs(I_exacta-I_nc_2);

printf("Para n=2 se obtienen los siguientes resultados: \n");
printf("Gauss          = %.12f\n", I_gauss_2);
printf("Error Gauss    = %.4e\n", err_gauss_2);
printf("Newton-Cotes   = %.12f\n", I_nc_2);
printf("Error N-C      = %.4e\n", err_nc_2);


%ahora para n=3
n2=3;
I_gauss_3=cuad_gauss_c(f,a,b,L,n2);
I_nc_3=intNCcompuesta(f,a,b,L,n2);

err_gauss_3=abs(I_exacta-I_gauss_3);
err_nc_3=abs(I_exacta-I_nc_3);

printf("==================================================================\n")
printf("Para n=3 se obtienen los siguientes resultados: \n");
printf("Gauss          = %.12f\n", I_gauss_3);
printf("Error Gauss    = %.4e\n", err_gauss_3);
printf("Newton-Cotes   = %.12f\n", I_nc_3);
printf("Error N-C      = %.4e\n", err_nc_3);
printf("==================================================================\n")
if err_gauss_2 < err_nc_2
    printf("Para n=2 Gauss fue más preciso.\n");
else
    printf("Para n=2 Newton-Cotes fue más preciso.\n");
endif

if err_gauss_3 < err_nc_3
    printf("Para n=3 Gauss fue más preciso.\n");
else
    printf("Para n=3 Newton-Cotes fue más preciso.\n");
endif

