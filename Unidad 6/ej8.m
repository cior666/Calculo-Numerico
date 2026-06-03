addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
a=-1;
b=1;
L=1;
n=2;
%primero chequeo con n=2
%la idea es verificar hasta qué grado de polinomio una cuadratura integra exactamente.
%entonces hago variar k de 0 a 6
for k=0:6
    f=@(x) x.^k;
    I_gauss=cuad_gauss_c(f,a,b,L,n);
    I_real=integral(f,a,b);
    err=abs(I_gauss-I_real);
    printf("k = %d | I_real = %.10f | I_gauss = %.10f | Error = %.2e\n", k, I_real, I_gauss, err);
end

%parte B
A = [1 1 1;-1 0 1;1 0 1];

b = [2;0;2/3];

c = GaussLUPP(A,b);
disp("los valores de c son: ");
disp(c);

