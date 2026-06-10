%La intensidad de la radiación emitida de una fuente viene dada por la ecuación: I(t)=I0*exp(-at) 
%Determinar las constantes  I0 y a utilizando los datos siguientes:
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% datos
t = [0.2 0.3 0.4 0.5 0.6 0.7 0.8];
i = [3.16 2.38 1.75 1.34 1.00 0.74 0.56];

%partiendo de la ec de dato: I(t)=I0*exp(-at)
%hago ln a ambos miembros entonces, ln(I(t))=ln(I0*exp(-at))
%tomo Y= ln(I) A=ln(I0), entonces, Y=A-a*t q es una recta Y=a0+a1*t
%con a0=A=ln(I0), entonces, a1=-a

% linealizacion
y = log(i);

% ajuste lineal por cuadrados minimos
p = min_cuadrados(t,y,1);

% recuperacion de parametros
alpha = -p(1);
i0 = exp(p(2));

printf('i0 = %.6f\n',i0)
printf('alpha = %.6f\n',alpha)

%los valores obtenidos son:
%i0 = 5.631019
%alpha = 2.888285