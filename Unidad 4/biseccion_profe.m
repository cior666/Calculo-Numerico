function [p,h]=biseccion_profe(f,a,b,maxit,tol)
tic()
fa=f(a);
fb=f(b);
if sign(fa)*sign(fb)>0
    error('no se cumple la regla de los signos y tvm')
end

it=0;
while(it<maxit)
    it++;
    p=a+(b-a)/2;
    fp=f(p);
    h(it)=abs(fp);#error con corte residuo
    ##err=abs(b-a)/2 #error absoluto estimado

    if(h(it)<tol)
    #if err<tol
        break;
    endif;

    if(sign(fp)*sign(fb)<0)
        fa=fp;
        a=p;
    else
        fb=fp;
        b=p;
    endif
endwhile
t=toc();
endfunction


