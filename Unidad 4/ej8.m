addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
tol=1e-5;
kmax=100;
f=@(x) (((x+1/3).^3)+1/3).*(e.^-x)-1.5;
df=@(x) -((27 .* x.^3 - 54 .* x.^2 - 45 .* x + 1) .* e.^(-x)) / 27;
ddf=@(x) ((27 .* x.^3 - 135 .* x.^2 + 63 .* x + 46) * e.^(-x)) / 27;
x=linspace(0,10,50);
funcion=(((x+1/3).^3)+1/3).*(e.^-x)-1.5;
derivada=-((27 .* x.^3 - 54 .* x.^2 - 45 .* x + 1) .* e.^(-x)) / 27;
dderivada=((27 .* x.^3 - 135 .* x.^2 + 63 .* x + 46) .* e.^(-x)) / 27;

%figure;
%hold on;
%plot(x, funcion, 'm-', 'linewidth', 1.5);
%plot(x, derivada, 'b--', 'linewidth', 1.5);
%plot(x, dderivada, 'r--', 'linewidth', 1.5);
%legend('Función original', 'Primera Derivada', 'Segunda Derivada');
%title('Análisis de la Función y sus Derivadas');
%xlabel('Valores de x');
%ylabel('Valores de y');
%grid on;
%grid minor;
%hold off; % Siempre es buena práctica "apagar" el hold al terminar de graficar
%pause(10);

[x0,h0]=biseccion(f,0,2,tol,kmax);
fprintf('la primera raiz es: %f\n',x0);
[x1,h1]=biseccion(f,3.5,5,tol,kmax);
fprintf('la segunda raiz es: %f\n',x1);

#para encontrar la maxima energia del sistema sabemos que va a estar cuando en la primera derivada sea igual a cero. 
#viendo graficamente sabemos que ese valor esta entre 2 y 4. Entonces
[x2,h2]=biseccion(df,2,4,tol,kmax);
fprintf('la energia maxima del sistema esta en el instante: %f\n',x2);
e_max=(((x2+1/3).^3)+1/3).*(e.^-x2)-1.5;
fprintf('la energia maxima del sistema es: %f\n',e_max);


#(c) Determinar el instante de tiempo en donde se da la maxima tasa de crecimiento instantanea
#de la energıa respetando la precision anterior

#"Tasa de crecimiento instantánea": Esto es, por definición, la velocidad a la que cambia la energía.
#esto es exactamente la primera derivada de la energía, E ′(t). 

#"Máxima":El ejercicio te pide encontrar el instante de tiempo t donde esa tasa de crecimiento es la más grande posible. 
#Es decir, buscas el pico máximo de la curva de la primera derivada.

#El planteo para el método numérico:para encontrar el máximo de cualquier función, debemos derivarla e igualarla a cero. 
#Como nuestra función de interés ya es la primera derivada E ′(t), al derivarla nuevamente obtenemos la segunda derivada, E ′′(t).

[x3,h3]=biseccion(ddf,0,2,tol,kmax);
fprintf('la maxima tasa de crecimiento se da en el instante: %f\n',x3);


