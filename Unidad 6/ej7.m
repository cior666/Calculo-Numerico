x=[0;200;400;600;800;1000;1200];
rho=[4;3.95;3.89;3.80;3.60;3.41;3.30];
Ac=[100;103;106;110;120;133;149.6];
%la masa total de una barra de densidad variable esta dada por
%integral de 0 a L de rho en x por Ac en x.
%Donde m representa la masa, rho la densidad y Ac la seccion transversal
%x representa la distancia a alo largo de mla barra y L la long de la barra

%=== PASO 1: Calcular la función a integrar y = f(x) ===
% f(x) = rho(x) * Ac(x)
y = rho .* Ac;

%1. Cuándo usar intNCcompuesta.m (La función del profesor)
%Solo puedes usar esta función cuando tienes la ecuación matemática (fórmula analítica) de tu problema 
%¿Por qué? Si miras el código de intNCcompuesta.m, verás que el primer parámetro que pide es f, y adentro hace x = linspace(...) y fx = f(x) . 
%Es decir, la función necesita la fórmula para "inventar" y evaluar sus propios puntos.

%2. Cuándo usar tus funciones trapcomp y simpsoncomp
%Debes usar las funciones que vos mismo programaste en el Ejercicio 6 cuando tienes una tabla de valores crudos o mediciones de laboratorio 

%Las tres funciones te retornan exactamente lo mismo  un único número que representa el valor aproximado de la integral definida (es decir, el área bajo la curva). 
%La diferencia radica en cómo procesan la información para llegar a ese número.

%Específicamente, esto es lo que retorna cada una:
%intNCcompuesta(f, a, b, L, n): Te retorna el valor numérico Q de la integral aproximada de una función matemática analítica f en el intervalo [a, b], 
%subdividiendo el dominio en L pedacitos y usando una regla de Newton-Cotes de n puntos.

%trapcomp(x, y): Te retorna el valor numérico de la integral calculando y sumando el área de pequeños trapecios formados uniendo con líneas rectas 
%los puntos discretos que le pasaste en los vectores x e y .

%simpsoncomp(x, y): Te retorna el valor numérico de la integral calculando y sumando el área debajo de pequeñas parábolas que el algoritmo 
%ajusta utilizando los puntos de los vectores x e y

%Como tenemos valores x-espaciados y una cantidad IMPAR de ellos, usaremos simpson
%(a) Calcule la masa total de la barra y detalle que formula de cuadratura utilizo.
masa_simpson = simpsoncomp(x, y);
printf('--- INCISO A ---\n');
printf('La masa total de la barra (usando Simpson) es: %.2f gramos\n\n', masa_simpson);

%(b) Determine la precision del calculo del item anterior. Para ello, compare los resultados obtenidos
%usando las funciones del ejercicio 6, realizando una diferencia relativa.
% Inciso (b): Comparación con Trapecio [1]
masa_trapecio = trapcomp(x, y);

% Calculamos la diferencia relativa asumiendo a Simpson como el más exacto
dif_relativa = abs(masa_simpson - masa_trapecio) / abs(masa_simpson);

printf('--- INCISO B ---\n');
printf('La masa usando Trapecio es: %.2f gramos\n', masa_trapecio);
printf('Diferencia relativa entre ambos métodos: %.6e\n', dif_relativa);

%Al hacer la diferencia relativa entre ambos resultados, estás estimando matemáticamente el error de tu cálculo
%. Si el Trapecio (que es menos preciso) y Simpson (que es muy preciso) dan valores casi idénticos (una diferencia relativa minúscula), 
%te confirma empíricamente que tu discretización (el paso h=200 cm) es lo suficientemente fina y que tu resultado de masa es altamente confiable.