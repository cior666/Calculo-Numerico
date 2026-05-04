% para cargar los datos de las funciones.
% una alternativa es poner en la linea de comando sin necesidad de hacer 
% un script o una funcion:
% f = @(x)(escribir la funcion)
% Ej:  f = @(x)(x^3-4*x^2 +x -10)

% la otra alternativa es escribir la funcion en un script:
% function f = datosfp(x)

% f = x^3-25;

% cargar la funcion anterior de la siguiente forma en el algoritmo que calcula:

% [p,rh,it,t] = biseccion(@datosfp,a,b,maxit,tol)

% datos de los colores
% ‘k’, "black"	blacK
% ‘r’, "red"	Red
% ‘g’, "green"	Green
% ‘b’, "blue"	Blue
% ‘y’, "yellow"	Yellow
% ‘m’, "magenta" Magenta
% 'c’, "cyan"	Cyan
% ‘w’, "white"	White

% Estilos de lineas


% plot(V,I, 'ro-', 'markersize', 5, 'linewidth', 3);