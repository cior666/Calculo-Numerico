%es un ejercicio relacionado al 6 de la guia tp5(MOSQUITOS), entonces uso el archivo de datos_velocidades txt.
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% datos del ejercicio 
t = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

% ajuste por cuadrados minimos de grado 4
p4 = min_cuadrados(t,y,4);

% evaluar el ajuste sobre los datos
y_aprox = polyval(p4,t);

% error cuadratico
ec = sum((y-y_aprox).^2);

%la logica va siempre de comparar el valor aproximado con el valor real que me dan, en este caso, predijo el valor
%a 10 semanas usando el polinomio de grado 4 que obtuve con min_cuadrados y a ese le hago el rel con el q me da
%la consigna osea 14900

% prediccion a las 10 semanas
y10 = polyval(p4,10);

% valor real dado por la consigna
yreal = 14900;

% error relativo a las 10 semanas
er = abs(yreal-y10)/abs(yreal);

% mostrar resultados
printf('coeficientes del polinomio\n')
disp(p4)
printf('\n')
printf('error cuadratico: %.6f\n',ec)
printf('prediccion para 10 semanas: %.6f\n',y10)
printf('error relativo para 10 semanas: %.6f\n',er)

%resultados:
%error cuadratico: 12177.160173
%prediccion para 10 semanas: 23361.000000
%error relativo para 10 semanas: 0.567852
