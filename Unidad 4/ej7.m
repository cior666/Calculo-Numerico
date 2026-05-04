addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f=@(x) x.*(log(x+3)-17)-1;
tolbis=1e2;
tolrelnew=1e-12;
#sabemos que esta funcion corta pero muy lejos entonces vamos a buscar
#ese intervalo
a=0;
b=1;
%funcion=x.*(log(x+3)-17)-1;
while(f(a)*f(b)>0)  
    b*=2;
end
[x1,h1]=biseccion(f,b/2,b,tolbis,1000);
fprintf('el metodo de biseccion converge a: %f\n',x1);
fprintf('lo hace en it: %f\n',length(h1)-1);
df=@(x) log(x + 3) + x ./ (x + 3) - 17;
[x2,h2]=newton(f,df,x1,tolrelnew,1000);
fprintf('el metodo de newton converge a: %f\n',x2);
fprintf('lo hace en it: %f\n',length(h2)-1);