#resolver usando gauss seidel y analizar en cada caso.
#luego intentar resolver por metodo directo de gauss . es necesario aplicar alguna estrategia
#de pivoteo? justificar
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
A=[
    3 1 1;
    1 3 -1;
    3 1 -5
]
b1=[5;3;-1];
A2=[
    3 1 1;
    3 1 -5;
    1 3 -1;
]
b2=[5;-1;3];
#entonces ahora vamos a avanzar con la primera parte que pide hacer gauss seidel
#para eso voy a usar el algoritmo que ya tengo implementado en el archivo gauss_seidel.m
x0 = zeros(length(b1), 1);
maxit=1000;
tol = 1e-8;
[x, ~, it] = gaussseidel(A,b1,x0,maxit,tol);
printf("it = %d\n", it);
#ahora hago lo mismo pero uso a la sda matriz y el 2do vector
x1=zeros(length(b2),1);
maxit=1000;
tol=1e-8;
[x, ~, it] = gaussseidel(A2,b2,x1,maxit,tol);
printf("it = %d\n", it);
#ahora voy a hacer la parte de gauss
#para eso voy a usar el algoritmo que ya tengo implementado en el archivo gauss.m
#para ver si tengo que aplicar alguna regla de pivoteo primero voy a revisar que
#sean edd y sdp

#disp('Matriz A1:');
#es_edd1 = edd(A);
#es_sdp1 = sdp(A);
#disp('###########');
#disp('Matriz A2:');
#disp('DDD: ');
#es_edd2 = edd(A2);
#disp('SDP: ');
#es_sdp2 = sdp(A2);

#entonces, como A1 es EDD , puedo aplicar gauss directo sin el pivoteo.
disp('resolucion por gauss de A1');
x1=gauss(A,b1);
disp('resultado:');
disp(x1);

#para A2, falla que sea EDD y SDP,entonces no pueod aplicar gauss directo
#tengo que pivotearla o usar el gauss con pivoteo que tengo armado
#entonces uso ese
disp('resuelvo con gauss con pivoteo para A2');
x2=gauss_p_sep(A2,b2);
disp('resultado:');
disp(x2);
