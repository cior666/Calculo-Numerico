addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
%la ecuacion diferencial siempre debe estar despejada de la forma
%y′=f(t,y)

%en este caso la y' ya esta despejada entonces defino a la funcion directametente
f=@(t,y) -y+sin(t)+cos(t);
y0=0;
inter=[0 2];
%nos pide conocer el valor de la variable de estado y a tiempo t=2
t=2;
%para comparar errores necesito conocer el valor exacto, para ello debo resolver
%la edo
%1) y'+y=sin(t)+cos(t)
%2) y(t)=sin(t)
%3) y'(t)=cos(t)
%entonces cos(t)=-sin(t)+sin(t)+cos(t)
%ademas, y(=)=sin(0)=0
y_exacta=sin(2);
printf("--- INCISO A: Aproximacion en t=2 ---\n");
printf("h\t\tL\tEuler\t\tRK2\t\tRK4\n");
valores_h=[1/10,1/20,1/40,1/80,1/160,1/320];
for i=1:length(valores_h)%itero la cantidad de valores de h
    h=valores_h(i); %en h tomo el valor del vector en el instante
    L=2/h; %calculo cantidad de subintervalos
    %ahora ya tengo todos los datos para hacer la llamada a los algoritmos
    [t_e,y_e]=euler(f,inter,y0,L);
    [t_rk2,y_rk2]=rk2(f,inter,y0,L);
    [t_rk4,y_rk4]=rk4(f,inter,y0,L);
    %el ultimo elemento corresponde a t=2
    %Cuando nosotros definimos el intervalo del problema como inter y se lo pasamos a tus funciones, 
    %lo primero q hacen los algortimos es construir un vector de tiempo t usando linespace(inter(1), inter(2), L+1) . 
    %Esta instrucción crea matemáticamente una red de nodos temporales (de tamaño L+1) que arranca exactamente en t=0 y termina exactamente en t=2 
    val_e=y_e(end);
    val_rk2=y_rk2(end);
    val_rk4=y_rk4(end);
    printf("1/%d\t\t%d\t%.6f\t%.6f\t%.6f\n", 1/h, L, val_e, val_rk2, val_rk4);
endfor
printf("======================================================\n");

%b)
%como tenemos que reportar con tres decimales correctos y seis decimales correctos
%podemos definir un vector con estas tolerancias 
tols=[0.5e-3,0.5e-6];
nombres_tol={"3 decimales","6 decimales"};
%ahora debo definir la cantidad de evaluaciones de f q hace cada metodo por paso
evals_paso=[1 2 4];
for m=1:3
    for k=1:2
    %hago busqueda binaria para encontrar el L exacto
    L_bajo=1;
    L_alto=2;
    %busco un limite superior duplicando pasos
    err=1;
    while err>tols(k)
        L_alto=L_alto*2;
        if m==1
            [~,y_ap]=euler(f,inter,y0,L_alto);
        elseif m==2 
            [~,y_ap]=rk2(f,inter,y0,L_alto);
        else 
            [~,y_ap]=rk4(f,inter,y0,L_alto); 
        endif
    err=abs(y_exacta-y_ap(end));
    endwhile
%acoto el rango dividiendo a la mtiad para hallar el L minimo
while L_alto-L_bajo>1
    L_medio=floor((L_bajo+L_alto)/2);
    if m==1
        [~,y_ap]=euler(f,inter,y0,L_medio);
    elseif m==2 
        [~,y_ap]=rk2(f,inter,y0,L_medio);
    else 
        [~,y_ap]=rk4(f,inter,y0,L_medio);
    endif
    err=abs(y_exacta-y_ap(end));
    if err>=tols(k)
        L_bajo=L_medio;
        else
        L_alto=L_medio;
    endif
endwhile
L_req=L_alto;%guardo el resultado de la busqueda binaria
total_evals=L_req*evals_paso(m);%calculo la cantidad total de veces que evalue la f
%lo hago multiplicando pasos totales (L_req) por la cantidad de veces que el metodo
%necesita evaluar al funcion en un solo paso (evals_paso(m))
 metodo_nombre = {"Euler", "RK2  ", "RK4  "}{m};
        printf("%s (%s): L = %d | Evals de f = %d\n", metodo_nombre, nombres_tol{k}, L_req, total_evals);
    endfor
endfor

%Resultados:
%Euler (3 decimales): L = 1462 | Evals de f = 1462
%Euler (6 decimales): L = 1460781 | Evals de f = 1460781
%RK2   (3 decimales): L = 41 | Evals de f = 82
%RK2   (6 decimales): L = 1258 | Evals de f = 2516
%RK4   (3 decimales): L = 5 | Evals de f = 20
%RK4   (6 decimales): L = 22 | Evals de f = 88