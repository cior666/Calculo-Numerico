addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
A=[10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b=[6 ;25 ;-11 ;-11];

x0 = zeros(length(b), 1);
  %x0 = zeros(size(A,1), 1);  % también podés usar size(A,2) si A es cuadrada
%defino la cantidad de maximas iteraciones y la tolerancia 
  maxit=1000;
  tol = 1e-8;
%sabemos que SOR converge para matrices definidas positivas si 0 <w< 2. 
%pruebo valores desde 1.0 hasta 1.9 saltando de a 0.1.
for w=1.0:0.1:1.9
%Usar ~ le dice a Octave: 
%"La función devuelve tres cosas, pero la segunda (el vector de residuos) ignorala 
%y no gastes memoria en guardarla".
    [x, ~, it] = sor(A,b,x0,maxit,tol,w); % ~ significa que no retorne esa variable
    printf("w = %.1f, it = %f\n", w, it);
end