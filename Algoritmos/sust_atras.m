function x=sust_atras(A,b)
n=length(b);
x=zeros(n,1); #inicializamos el vector solucion
x(n)=b(n)/A(n,n); #calculamos la ultima incognita
#hacemos el bucle hacia atras, desde la penultima fila hasta la primera
for i=n-1:-1:1
    x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
endfor
endfunction