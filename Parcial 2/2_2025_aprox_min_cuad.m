x=[0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4];
y=[0.0653 0.066 0.0657 0.0651 0.0635 0.0611 0.058 0.0544];
%hago la linealizacion
z=1./y;
%tenemos el modelo f(x)=1/(a+be^x+ce^-x), si invierto a izq y der
%obtengo 1/f(x)=a+be^x+ce^-x entonces definimos z=1/y
%obteniendo asi un modelo lineal en los parametros z=a+be^x+ce^-x
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%de aca obtengo que: phi1=1, phi2=ex, phi3=e^-x y armo la matriz
A=[ones(length(x),1) exp(x') exp(-x')];
%ahora q tengo A puedo armar M y b osea ec normales:
M=A'*A;
b=A'*z';
%resuelvo el sistema para obtener a,b,c
[p,r]=gauss_p(M,b);
a = p(1);
bcoef = p(2);
ccoef = p(3);
printf('a = %.6f\n',a);
printf('b = %.6f\n',bcoef);
printf('c = %.6f\n',ccoef);
%RESULTADOS el ej pide con 4 decimales:
%a = 10.420810 RTA: 10.4208
%b = 1.769209 RTA: 1.7692
%c = 3.141299 RTA: 3.1413

%como ya tengo a,b,c puedo definir la f
f=@(x) 1./(a+bcoef.*exp(x)+ccoef.*exp(-x));
%defino la interseccion con y=x/20
g=@(x) f(x)-x./20
xx = linspace(0,5,1000);

%plot(xx,f(xx))
%hold on
%plot(xx,xx./20)
%grid on
%legend('f(x)','x/20')
%pause(10);
%viendo la grafica saco los extremos p revisar:
a=1.15;
b=1.2;
kmax=100;
cruce=biseccion(g,a,b,1e-10,kmax);
printf('cruce=%.10f\n',cruce);
%RESPUESTA pide con 7 decimales:
%cruce=1.1698899567 entonces cruce=1.1698900

%(c)Calcule  el área comprendida entre ambas curvas y limitada a la izquierda por el eje
% discretizacion
N = 1000;
xint = linspace(0,cruce,N+1);
yint = g(xint);
% area
A_trap = trapcomp(xint,yint);
fprintf("Area (Trapecio) = %.10f\n",A_trap);

%RESULTADOS con 7 decimales:
%Area (Trapecio) = 0.0407152402 entonces: A=0.0407152 
