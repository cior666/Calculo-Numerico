function [x, it, rh_x, rh_y, t] = bisection (f, xmin, xmax, maxit,tol)

 % Signos iguales
 if (sign(f(xmin)) * sign(f(xmax)) > 0)
 error('No se cumple Bolzano');
 endif
 tic();

 rh_x = []; rh_y = [];

 it = 0;
 while (it < maxit)
 it++;

 % Punto medio y evaluacion de la funcion

 x = xmin + (xmax-xmin)/2;
 f_x = f(x);

 % Se elige cual de los dos intervalos contiene la ra?z
 if (sign(f_x) * sign(f(xmax)) > 0)
 xmax = x;
 else
 xmin = x;
 endif
 % Residuos en x
 rh_x = [rh_x, abs(f_x)];
 % Residuos en y
 rh_y = [rh_y, xmax-xmin];

 % Condiciones de corte: residuo en x o en y o se encontro´ exactamente la raiz
 if (rh_y(it) < tol && rh_x(it) < tol || f_x == 0)
 break;
 endif
 endwhile
 t = toc();
 endfunction