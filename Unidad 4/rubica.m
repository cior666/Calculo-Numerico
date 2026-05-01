function x=rubica(a)
#Escribir una funcion x=rcubica(a) para calcular la raız cubica de a con un error relativo me
#nor a 10−12 usando biseccion. En la misma debe hacer una llamada a la funcion implementada
#en (b).
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f = @(x) x^3 - a;
  if a >= 1
  #Si a≥1: La raíz cúbica de un número mayor a 1 siempre será menor que el propio número
  #Por lo tanto, el intervalo de búsqueda seguro es [0, a]. Si evalúas los extremos: 
  #f(0)=−a (negativo) y f(a)=a^3 −a=a(a^2−1) (positivo). 
  #como hay cambio de signo, el método va a funcionar.
    [x, ~] = biseccion(f, 0, a, 1000, 1e-12);
  else
  #Si 0≤a<1: La raíz cúbica de un número decimal entre 0 y 1 siempre 
  #es un número un poco más grande, pero que no supera el 1
    [x, ~] = biseccion(f, 0, 1, 1000, 1e-12);
  endif
endfunction