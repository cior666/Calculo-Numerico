x = [3; 5; 7; 9];
y = [1.2; 1.7; 2.0; 2.1];

%primero pide resolver con lagrange, para eso usamos la func de lagrange
%la func recibe P y L donde
%P: Polinomio de Lagrande
% L: Contiene los coeficientes de polinomio base Li(x)
[P_lagrange,~]=Lagrange(x,y);
disp("Coeficientes de lagrange: ");
disp(P_lagrange);


%ahora pide resolver por metodo de coeficientes indeterminados
%primero armo la matriz de vandermonde
A_vandermonde=[x.^3,x.^2,x,ones(length(x))];
coeficientes=GaussLUPP(A_vandermonde,y);
disp("Coeficientes indeterminados: ");
disp(coeficientes);

%aunque exactamente en consola den:
%Coeficientes de lagrange: 
%        0  -0.0250   0.4500   0.0750

%Coeficientes por Vandermonde [d, c, b, a]:
%  -2.5585e-17  -2.5000e-02   4.5000e-01   7.5000e-02

%Son iguales.
