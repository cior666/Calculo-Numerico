% Alumno: Ciorciari Conrado || DNI: 43426610
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');

%DESAROLLO DE LA OBTENCION DEL SISTEMA HECHO EN HOJA

f = @(t,y) [ y(2);exp(-t)*(2+0.5*t) + (0.5/(2+0.5*t))*y(2) - 3*(2+0.5*t)*y(1)];
%valores iniciales
y0 = [1;0];

%pide usar rk4 para estimar pos y vel en t=4 con 7 exactas
a=0;
b=4;
inter=[a b];
%como no me da el h lo tengo que hallar iterando hasta ver q la sol se estabiliza
h = 0.5; %tomo un valor aleatorio p empezar a iterar
for k=1:8
    L = round((b-a)/h);
    [t,Y] = rk4(f,inter,y0,L);
    pos = Y(end,1);
    vel = Y(end,2);
    printf("%10.7f   %14.10f   %14.10f\n",h,pos,vel);
    h = h/2;
endfor

%de aca obtenemos una tabla q tiene estos resultados: primer columna es h, segunda columna es pos(4) tercera es vel(4)
% 0.5000000     0.3499276055     1.3199891061
% 0.2500000     0.6029349280     2.0709541778
% 0.1250000     0.6292957014     2.0716874578
% 0.0625000     0.6308796577     2.0697435801
% 0.0312500     0.6309716914     2.0695648917
% 0.0156250     0.6309771604     2.0695520483
% 0.0078125     0.6309774924     2.0695511952
% 0.0039062     0.6309775128     2.0695511403

%vemos que en las ultimas dos iteraciones los nros practicamente no cambian, entonces, vamos a tomar esos valores q serian
%para pos: 0.6309775128 y para vel: 2.0695511403

%REPORTO CON 7 CORRECTAS: pos(4)=0.6309775 y vel(4)=2.069551 

%c) Determinar ⟨Ek⟩ una vez transcurridos 10 segundos, con 8 cifras significativas.
a2=0;
b2=10;
inter2=[a2 b2];
L = 10; %tomo la misma logica que en el inciso anterior, al no definirme h ni L,debo encontrar cuando se estabiliza la solucion
for k=1:8
    [t,Y2] = rk4(f,[0 10],y0,L);
    vel = Y2(:,2); %traigo la velocidad
    m = 2 + 0.5*t;
    g = 0.5.* m.*vel.^2;
    Ek = simpsoncomp(t,g)/10;
    fprintf("L=%5d   Ek=%.10f\n",L,Ek);
    L = 2*L;
endfor

%L=   10   Ek=1551067795874.0795898438
%L=   20   Ek=1.7850350042
%L=   40   Ek=11.7288640246
%L=   80   Ek=14.1680488463
%L=  160   Ek=14.2789121263
%L=  320   Ek=14.2834081412
%L=  640   Ek=14.2836067761
%L= 1280   Ek=14.2836165574

% misma logica q inciso anterior, las ultimas dos iteraciones se asemejan bastante, entonces tomo el ultimo valor:
% L= 1280   Ek=14.2836165574 y reporto 14.283617