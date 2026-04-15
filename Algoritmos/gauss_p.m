fuction [x]=gauss_p(A,b)
n=length(b);
A=[A b];
r=1:n;
epsilon=1e-9;
for k=1:n-1
#la funcion max devuelve pmax q es el pivote de mayor valor absoluto
#p: posicion donde se encuentra pmax(local)
    [pmax, p]=max(abs(A(r(k:n),k)));
    if pmax<epsilon
        error("Los posibles pivotes son Cero");
        break
    endif
    p=p+k-1; #actualizamos pos a numeracion global
    if p~=k #distinto de o no es igual a: tb puedo hacer el != pero es lo mismo
        r([p k])=r([k p]); #actualiza el pivote
    endif
    A(r(k+1:n),k)=A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n+1)=A(r(k+1:n),k+1:n+1)-A(r(k+1:n),k)*A(r(k),k+1:n+1);
    endfor
    x=sust_atras(A(r,:));
endfunction


