%defino la funcion y su derivada
f=@(x) 20.*x - (x.^3)/5;
df=@(x) 20-(3*x.^(2))/5;
g=@(x) 2*pi*f(x).*sqrt(1+df(x).^2);

%primero evaluo gauss con n=3
a=0;
b=2;
L=1;
n=3;
A_gauss=cuad_gauss_c(g,a,b,L,n);
fprintf("El valor que toma para cuad_gauss es: %.10f\n",A_gauss);

%ahora comparo con simpson simple
A_simpson=intNCcompuesta(g,a,b,L,n);
fprintf("El valor que toma para intNCcompuesta es: %.10f\n",A_simpson);

%ahora trapecio compuesto, necesito una tabla de puntos.
L=5;
x=linspace(a,b,L+1);
y=g(x);
A_trapecio=trapcomp(x,y);
fprintf("El valor que toma para trapcomp es: %.10f\n",A_trapecio);

%con los mismos puntos hago el simpson compuesto con L=5
A_simp_comp=simpsoncomp(x,y);
fprintf("El valor que toma para simpsoncomp es: %.10f\n",A_simp_comp);


%pide comparar con un valor de referencia usando la funcion quad
A_ref=quad(g,a,b);
fprintf("el valor de referencia (quad) es: %.10f\n\n",A_ref);


%calculo errores

err_gauss = abs(A_ref - A_gauss);
err_simpson = abs(A_ref - A_simpson);
err_trapecio = abs(A_ref - A_trapecio);
err_simp_comp = abs(A_ref - A_simp_comp);

fprintf("error cuad_gauss      = %.10e\n",err_gauss);
fprintf("error intNCcompuesta = %.10e\n",err_simpson);
fprintf("error trapcomp       = %.10e\n",err_trapecio);
fprintf("error simpsoncomp    = %.10e\n",err_simp_comp);


