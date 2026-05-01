function x = sust_atras(A)
   n = size(A, 1); # Sacamos n contando las filas de la matriz A
   x = zeros(n, 1); # Crea el vector columna solucion
   
   # Despejamos el último valor (usamos A(n, end) en lugar de b(n))
   x(n) = A(n, end) / A(n, n);
   
   for i = n-1:-1:1 # loop hacia atras
     # Despejamos usando A(i, end) en lugar de b(i)
     x(i) = (A(i, end) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
   endfor
endfunction