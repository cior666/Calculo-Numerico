#considere el sistema que Ax=b cuya matriz A tiene las entradas:
#aij=2 si j=i, para i=1,2,.....,40
#-1 si j=i+1, para i=1,2,....,39
#-1 si j=i-1 para i=2,3,....,40
#0 para otro caso.
#las entradas del vector b se definen como bi=1.5i-6 para i=1,2,....40

addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
n=40;
#armo la diagonal principal
v_princ=2*ones(n,1);
D_princ=diag(v_princ,0);
#ahora la diag superior
v_sup= -1*ones(n-1,1);
D_sup=diag(v_sup,1);
#ahora la diag inferior
v_inf=-1*ones(n-1,1);
D_inf=diag(v_inf,-1);
#armo la matriz A sumando las tres matrices dispersas
A=D_princ+D_sup+D_inf;

#ahora que tengo A solo me falta armar el vector b
i=(1:n)';
b=(1.5*i)-6;
#al tener A y b puedo empezar a aplicar las resoluciones

#a) me pide resolver usando gauss y determinar el valor de x20.
x=gauss(A,b);
disp('el valor de x(20) es: ');
disp(x(20));

#b) resolver por jacobi gauss seidel y sor usando w=1.85. devolver cantidad de iteraciones
#ademas usar criterio de convergencia norma infinito del error relativo entre dos iteraciones sucesivas
# comenzar las iteraciones con el vector nulo considerar un error de 10^-5
 
#inicializo los parametros
x0=zeros(length(b),1);
tol=1e-5;
maxit=10000;
w=1.85;
#gausseidel
[x, it, ~, t] = gauss_seidel(A,b,x0,maxit,tol);
printf("Gauss seidel it = %d\n", it);
printf("Gauss seidel t = %d\n", t);


#jacobi
x0nuevo=zeros(length(b),1);
[x, it, ~, t] = jacobi(A,b,x0nuevo,maxit,tol);
printf("Jacobi it = %d\n", it);
printf("Jacobi t = %d\n", t);


#sor
[x, it, ~, t] = sor(A,b,x0,maxit,tol,w);
printf("SOR it = %d\n", it);
printf("SOR t = %d\n", t);

