%El tiempo se mide en horas transcurridas despues de finalizar la tormenta, y la unidad CFU es
%una unidad de formacion de colonia. Se sabe que un modelo para la concentracion tiene la forma
%c(t) = be−kt, donde b y k son constantes positivas.
x=[4;8;12;16;20;24];
y=[1590;1320;1000;900;650;560];
%a)Determine los valores de b y de k, utilizando el metodo de mınimos cuadrados.
%para encontrar k debo bajarlo del e, como en ej 7
%entonces me quedaria ln(y(t))=ln(b)-k*t
y2=log(y);
p=polyfit(x,y2,1);
%cuando hago polyfit de n=1, lo que me retorna primero osea
%p(1) es el valor de la pendiente de la recta(-k) y p(2) la ord al origen (ln b)
k=-p(1);
%como el valor que me retorna en p(2) es ln b, debo aplicarle la exp
%para obtener el valor de b puro.
ordenada=exp(p(2));

printf('El valor de la constante k es: %.4f\n', k);
printf('El valor de la constante b es: %.4f\n', ordenada);

%b) Utilice el modelo para estimar la concentracion al final de la tormenta.
%para estimar debo de usar la ecuacion original pero con los valores de b y k obtenidos
%y_estima=b*exp(-k*x); donde x es el tiempo
y_final=ordenada*exp(-k*0);
printf('El valor de la estimacion es : %.4f\n', y_final);

% Utilice el modelo para determinar el tiempo en el que la concentraci´on ser´a 200 CFU / 100
%mL.

%me esta dando el valor de y, entonces
%ln(y)=ln(ordenada*exp(-k*t))
%ln(y)=ln(ordenada)+(-k*t)
%ln(y)-ln(ordenada)=-k*t
%(ln(y)-ln(ordenada))/-k=t
y_buscado=200;
t=(log(y_buscado)-log(ordenada))/(-k);
printf('El tiempo en que se llega a esa conc es : %.4f\n', t);