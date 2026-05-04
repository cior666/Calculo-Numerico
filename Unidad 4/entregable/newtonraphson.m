function [x, it, rh, t] = newtonraphson (f, df, x0, maxit, tol)
tic();

 % Convergencia en el eje x absoluta y relativa
 ## rh_x = []; rh_xr = [];
 % Residuo en f(x)
 rh = [];

 it = 0;
 while (it < maxit)
 it++;

 x = x0 - (f(x0) / df(x0));

 % Diferencia absoluta
 ## rh_x = [rh_x, abs(x - x0)];
 % Diferencia relativa
 ## rh_xr = [rh_xr, rh_x(it)/abs(x)];

2 % Residuo absoluto
 rh = [rh, abs(f(x))];

 % La detencion de las iteraciones es en funcion de
 % la diferencia absoluta entre dos iteraciones
 ## if (rh_x(it) < tol)
 % la diferencia relativa entre dos iteraciones
 ## if (rh_x(it) < tol*abs(x))
 % el residuo absoluto
 if (rh(it) < tol)
 break;
 endif
 x0 = x;
 endwhile
 t = toc();
 endfunction