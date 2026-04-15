function [x]=gauss(A,b)
n=length(b);
A=[A b];
#hacemos la eliminacion
for k=1:n-1
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k)=0;
    A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-m*A(k,k+1:n+1);
endfor
if(A(n,n)==0)
    error("El sistema no tiene solucion unica");
end
#hacemos la sustitucion hacia atras
x=sust_atras(A,b);
endfunction

