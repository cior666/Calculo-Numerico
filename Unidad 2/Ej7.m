N=100;
#la primera ecuacion dice: x1=0 esto significa
#que la primera fila de la matriz A es un 1 seguido de ceros. y el primer elemento de b
#tambien es 0.
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
#La ultima ecuacion dice i=N, dice que Xn=0. La ultima fila de A es puros ceros
#termina en 1 y el ultimo elemento de b es 0.
####################################################
#Para el medio tenemos que: i=2 hasta N-1 siguen la regla de: -X(i-1)+2X(i)-X(i+1)=0
#esto significa que la matriz A va a tener 2 en la diagonal principal, 
#-1 en la diagonal de arriba y -1 en la diagonal de abajo. El vector b en el medio vale 1/N^2
A=diag(2*ones(N,1));
#ahora debo agregarle la diagonal de arriba y de abajo con -1
A=A+diag(-1*ones(N-1,1),1)+diag(-1*ones(N-1,1),-1);
#Para la primera fila:
A(1, :)=0;
A(1, 1)=1;
#Para la ultima fila:
A(N, :)=0;
A(N, N)=1;
#Ahora tengo que armar el vector b.
b=(1/N^2)*ones(N,1);
b(1)=0; #primera condicion de la que hablamos mas arriba
b(N)=0; #ultima condicion de la que hablamos mas arriba
#Ahora que tengo armada la matrix puedo resolver con gauss
x_sol=gauss(A,b);
disp('Solucion del sistema: ');
disp(x_sol);

#ahora tengo que graficar para ello:
#armo el vector de 0 a 1 con N ptos distribuidos de manera uniforme
t=linspace(0,1,N);


plot(t, x_sol, 'b-', 'LineWidth', 2);
axis([0 1 0 0.0050]); % [xmin xmax ymin ymax]
title('Solucion del sistema');
xlabel('ptos del intervalo [0,1]');
ylabel('solucion de x(t)');
grid on;
pause(10);