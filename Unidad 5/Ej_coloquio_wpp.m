addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
% defino f y su derivada
f = @(x) log(x.^2 + 1) - exp(x/2).*cos(pi*x);
df = @(x) (2*x)./(x.^2 + 1) - exp(x/2).*(0.5*cos(pi*x) - pi*sin(pi*x));

% defino los nodos como vectores fila para evitar errores de dimension
x = linspace(-5, 6, 9);
y = f(x);

% defino derivadas en extremos
df_ext = [df(-5), df(6)];

% calculo el spline sujeto usando tu funcion
[a, b, c, d] = cubic_spline_clamped(x, y, df_ext);

% --- inciso a ---
% evaluo en x=4.2 y calculo el error absoluto
x_eval = 4.2;
y_eval = spline_eval(x_eval, x, a, b, c, d);
err = abs(f(x_eval) - y_eval);
printf("error en x=4.2: %.8f\n\n", err);

% --- inciso b ---
% busco el maximo global
x_max = x(1);
max_val = y(1);

% evaluo derivadas de los polinomios q forman el spline
for i = 1:length(x)-1
    % polinomio de la derivada en este subintervalo
    p_der = [3*d(i), 2*c(i), b(i)];
    
    % busco raices 
    raices_dx = roots(p_der);
    
    % recorro raices q encontre
    for j = 1:length(raices_dx)
        % ignoro si es compleja (por errores numericos minimos)
        if abs(imag(raices_dx(j))) < 1e-10
            raiz_x = x(i) + real(raices_dx(j));
            
            % me fijo q caiga adentro de su propio subintervalo
            if raiz_x >= x(i) && raiz_x <= x(i+1)
                val = spline_eval(raiz_x, x, a, b, c, d);
                
                % guardo si es el mas grande q vi
                if val > max_val
                    max_val = val;
                    x_max = raiz_x;
                endif
            endif
        endif
    endfor
endfor

% verifico nodos por si acaso
for i = 1:length(x)
    if y(i) > max_val
        max_val = y(i);
        x_max = x(i);
    endif
endfor

printf("maximo = %.5f\n", max_val);
printf("alcanzado en x = %.9f\n", x_max);