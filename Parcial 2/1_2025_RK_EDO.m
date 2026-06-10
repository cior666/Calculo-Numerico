%una particula de masa m=1 y carga q=1 se mueve en el espacio bajo la ccion de un campo magnetico variable en el tiempo, sin presencia de campo electrico
%El movimeitno de la particula esta determinado por la fuerza de lorentz
%a(t)=dv/dt=v(t)xB(t)
%donde a(t) es el vector aceleracion y v=(vx,vy,vz) la velocidad de la particula
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%el campo electrico esta dado por B(t)=(0,0,sin(50t)), la ec de mov de la aprticula nos queda
%a=(vy(t)sin(50t),-vx(t)sin(50t),0). Suponiendo q la particula parte de la pos (1,0,0) con velocidad unitaria en la direccion del eje y.

%escribir el sistema de ec diferenciales ordinarias de primer orden que describe el movimiento de la particula y aplique el metodo RK4
%con paso h=0.02 para aproximar la pos de la particula en el instante t=2. cuantas cifras significativas correctas tiene el resultado?

%por lo armado en papel:

% sistema de ecuaciones
f = @(t,y) [y(4);y(5);y(6);y(5)*sin(50*t);-y(4)*sin(50*t);0];
%las cond iniciales vienen de la pos (1,0,0) y del hecho q tinee v unitaria en la direcc del eje y (0,1,0)
y0=[1;0;0;0;1;0];
h=0.02;
a=0;
b=2;
inter=[a b];
L=(b-a)/h;
[x,y]=rk4(f,inter,y0,L);
x=y(end,1);
y_f=y(end,2);
z=y(end,3);
fprintf("el valor de x es: %f\n",x);
fprintf("el valor de y es: %f\n",y_f);
fprintf("el valor de z es: %f\n",z);
%Para verlo entero al numero puedo hacer: format long disp(x), esto me da la cifra que tiene el profe de mas en la rta.
%el valor de x es: 1.040210 el correcto es: 1.0402103
%el valor de y es: 1.999414 el correcto es: 1.999414
%el valor de z es: 0.000000
fprintf("=================================================================\n");
%para ver cuantas cifras significativas correctas tiene, procedo a tomar un h mucho mas pequeno
printf("      h            x(t=2)          y(t=2)          z(t=2)\n");
printf("-----------------------------------------------------------\n");
for k = 1:5
    L = (b-a)/h;
    [t,Y] = rk4(f,inter,y0,L);
    xf = Y(end,1);
    yf = Y(end,2);
    zf = Y(end,3);
    printf("%10.6f   %12.8f   %12.8f   %12.8f\n",h,xf,yf,zf);
    % refino el paso
    h = h/2;
endfor
% tomo como referencia el ultimo refinamiento
x_ref = xf;
y_ref = yf;
% error relativo
Rx = abs(x_ref - x)/abs(x_ref);
Ry = abs(y_ref - y_f)/abs(y_ref);
% cifras significativas correctas segun Burden
tx = floor(log10(5/Rx));
ty = floor(log10(5/Ry));

printf("cifras significativas correctas en x = %d\n",tx);
printf("cifras significativas correctas en y = %d\n",ty);
%cifras significativas correctas en x = 5
%cifras significativas correctas en y = 5///// EL CORRECTO EN AMBOS CASOS ES 5.

%b) determinar las componentes de aceleracion en t=2 con 5 cifras significativas exactas.

%la aceleracion viene de: a=(vy(t)sin(50t),-vx(t)sin(50t),0)
vx=Y(end,4);
vy=Y(end,5);
vz=Y(end,6);
tf=2;
ax=vy*sin(50*tf);
ay=-vx*sin(50*tf);
az=0;
fprintf("ax = %.6f\n",ax);
fprintf("ay = %.7f\n",ay);
fprintf("az = %.6f\n",az);

%RESULTADOS YA CON 5 EXACTAS:
%ax=-0.506364 
%ay=0.0013943
%az-0

%dice que con los datos obtenidos en a debo hallar una aprox de la distancia recorrida
%para t=2. Entonces recalculo todo para no tener problemas de pisar variables
f = @(t,y) [y(4);y(5);y(6);y(5)*sin(50*t);-y(4)*sin(50*t);0];
%las cond iniciales vienen de la pos (1,0,0) y del hecho q tinee v unitaria en la direcc del eje y (0,1,0)
y0=[1;0;0;0;1;0];
h=0.02;
a=0;
b=2;
inter=[a b];
L=(b-a)/h;
[x,y]=rk4(f,inter,y0,L);
vx = y(:,4);
vy = y(:,5);
vz = y(:,6);
vnorm = sqrt(vx.^2 + vy.^2 + vz.^2);%calculo la norma
D_trap = trapcomp(x,vnorm);
fprintf("Distancia (Trapecio compuesto) = %.8f\n",D_trap);
%Resultado: Distancia (Trapecio compuesto) = 2.00001662