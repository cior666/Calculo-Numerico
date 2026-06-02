%un biologo realiza un experimento de reproduccion y obtiene una tabla, las consignas son:
%(a) Determinar el polinomio p6 de grado menor o igual que 6 que interpola los datos de la tabla.
%(b) Determinar la funcion lineal p1 que mejor aproxima en el sentido de cuadrados mınimos los
%datos dados (modelo lineal).
%(c) Determinar el polinomio p2 de grado ≤ 2 que mejor aproxima en el sentido de cuadrados
%m´ınimos los datos dados (modelo cuadratico).
%(d) Graficar los datos y la evolucion de los tres modelos calculados durante las seis semanas. De
%terminar el error cuadratico en cada caso. ¿cual de los modelos le parece que es mas apropiado
%y por que?
%(e) Predecir cual sera la cantidad de mosquitos al cabo de 10 semanas segun los diferentes modelos
%propuestos. ¿Sigue pensando que el modelo mas apropiado es el que eligio en el item anterior?
%(f) Si se sabe que la medicion a las 10 semanas es de 14900 mosquitos, calcule el error relativo de
%cada una de sus predicciones y verifique si el modelo que considero mas apropiado es el que
%da la mejor prediccion.

%el pto A me pide hallar el polinomio de grado menor o igual a 6 que interpola a los datos
%para ello uso la funcion polyfit
x=[0;1;2;3;4;5;6];
y=[432;599;1012;1909;2977;4190;5961];
p6=polyfit(x,y,6);

%el pto B me pide hallar la funcion lineal osea polinomio grado 1 que minimice la distancia
%cuadrada a los ptos
p1=polyfit(x,y,1);

%el pto C me pide hallar el polinomio de grado menor o igual 2 q mejor aproxima en el
%sentido de cuadrados minimos los datos dados
p2=polyfit(x,y,2);

%el pto D me pide hallar el error cuadratico para cada caso y graficar los datos
y_eval_p6=polyval(p6,x);
y_eval_p1=polyval(p1,x);
y_eval_p2=polyval(p2,x);
%el error cuadratico se calcula como la suma de (valor_real - valor_modelo)^2
err_cuad_p6=sum((y-y_eval_p6).^2);
err_cuad_p1=sum((y-y_eval_p1).^2);
err_cuad_p2=sum((y-y_eval_p2).^2);

printf("Los errores cuadraticos obtenidos son: ");
fprintf("Para el polinomio p6: %.4f\n",err_cuad_p6);
fprintf("Para el polinomio p1: %.4f\n",err_cuad_p1);
fprintf("Para el polinomio p2: %.4f\n",err_cuad_p2);

%Ese 0.0000 del polinomio p6 es un "espejismo". Te hace creer que el modelo es perfecto 
%dentro de las primeras 6 semanas, pero como viste en tus cálculos del inciso (e) y (f), 
%esa misma rigidez para tocar los puntos exactos hace que el polinomio se vuelva inestable 
%y falle catastróficamente al querer predecir el futuro (la semana 10). 
%En cambio, el modelo cuadrático p 2, que acepta tener un error de 20141, es capaz de capturar 
%la verdadera física del problema y hacer predicciones confiables.

% Graficamos usando un vector 'xx' suave con muchos puntos [cite: 146]
xx = linspace(0, 6, 200); 
yy_p6 = polyval(p6, xx);
yy_p1 = polyval(p1, xx);
yy_p2 = polyval(p2, xx);

figure(1);
hold on; grid on;
plot(x, y, 'ko', 'markersize', 8, 'markerfacecolor', 'k'); % Datos reales
plot(xx, yy_p6, 'b-', 'linewidth', 2);                     % Modelo P6
plot(xx, yy_p1, 'r--', 'linewidth', 2);                    % Modelo P1
plot(xx, yy_p2, 'g-.', 'linewidth', 2);                    % Modelo P2
legend('Datos', 'P6 (Exacto)', 'P1 (Lineal)', 'P2 (Cuadratico)', 'Location', 'northwest');
title('Ajuste de modelos de poblacion de mosquitos');
xlabel('Semanas'); ylabel('Cantidad');
hold off;

%El inciso E pide predecir a 10 semanas
x_pred=10;
y_pred_p6=polyval(p6,x_pred);
y_pred_p1=polyval(p1,x_pred);
y_pred_p2=polyval(p2,x_pred);

printf('--- Predicciones para la semana 10 ---\n');
printf('Prediccion P6 (Grado 6): %.0f mosquitos\n', y_pred_p6);
printf('Prediccion P1 (Lineal) : %.0f mosquitos\n', y_pred_p1);
printf('Prediccion P2 (Cuadrat): %.0f mosquitos\n\n', y_pred_p2);

%El inciso F pide hallar el error relativo de cada prediccion con respecto al valor que me da
valor_real=14900;
%el error relativo se calcula com: |Real - Aproximado| / |Real|
err_rel_p6=abs(valor_real-y_pred_p6)/abs(valor_real);
err_rel_p1=abs(valor_real-y_pred_p1)/abs(valor_real);
err_rel_p2=abs(valor_real-y_pred_p2)/abs(valor_real);

printf('--- Errores Relativos en la semana 10 (Valor real: 14900) ---\n');
printf('Error Relativo P6: %.4f (%.2f%%)\n', err_rel_p6, err_rel_p6*100);
printf('Error Relativo P1: %.4f (%.2f%%)\n', err_rel_p1, err_rel_p1*100);
printf('Error Relativo P2: %.4f (%.2f%%)\n', err_rel_p2, err_rel_p2*100);

%los nros obtenidos son: Error Relativo P6: 
%1.4605 (146.05%)
%Error Relativo P1: 0.4045 (40.45%)
%Error Relativo P2: 0.0400 (4.00%)

%Este ejercicio demuestra que "ajustar perfecto" los datos del pasado no garantiza predecir 
%bien el futuro. Los polinomios de alto grado sufren de inestabilidad y oscilaciones severas
%fuera del dominio de interpolación, por lo que los modelos de cuadrados mínimos de grado bajo (como el cuadrático) 
%son mucho más robustos y apropiados para la ingeniería y la predicción