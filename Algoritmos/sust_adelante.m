function x=sust_adelante(A,b)
n=length(b);
x=zeros(n,1); #inicializamos el vector solucion
x(1)=b(1)/A(1,1); #calculamos la primera incognia directamente;
#hacemos el bucle hacia adelante, desde la segunda fila hasta la ultima
for i=2:n
    #operacion vectorizada
    x(i)=(b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
endfor
endfunction
