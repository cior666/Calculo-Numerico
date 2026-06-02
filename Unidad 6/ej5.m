%el ejercicio pide comparar metodo del trapecio vs simpson
% Definimos la función, el intervalo y la integral exacta
f = @(x) sin(pi*x);
a = 0; 
b = 5;
I_exacta = 2 / pi; % Valor analítico exacto de la integral
% Variables para almacenar los errores de la iteración anterior (L/2)
E_trap_prev = 0;
E_simp_prev = 0;
% Bucle para recorrer los pasos h = 1/2, 1/4, ..., 1/4096
%Estos ratios responden exactamente a la pregunta del enunciado: "determinar en qué factor se reduce el error cuando se duplica la cantidad de subintervalos"
%Ratio trap: es la division entre E(L)trap y E(L/2)trap representa el cociente o relación entre el error actual y el error del paso anterior.
%Ratio simp: es la division entre E(L)simp y E(L/2)simp representa el cociente o relación entre el error actual y el error del paso anterior.
fprintf('h\t L\t Q2_L (Trapecio)\t E_L_trap\t Ratio_trap\t Q3_L (Simpson)\t E_L_simp\t Ratio_simp\n');
fprintf('-------------------------------------------------------------------------------------------------------------------------\n');
for i = 1:12
    % Calculamos el paso h y la cantidad de subintervalos L
    h = 1 / (2^i);
    L = (b - a) / h;
    % 1. Regla del Trapecio Compuesta (n = 2 puntos)
    Q_trap = intNCcompuesta(f, a, b, L, 2);
    E_trap = abs(I_exacta - Q_trap);
    
    % 2. Regla de Simpson Compuesta (n = 3 puntos)
    Q_simp = intNCcompuesta(f, a, b, L, 3);
    E_simp = abs(I_exacta - Q_simp);
  
    % 3. Cálculos de Ratios e Impresión de la Tabla
    if i == 1
        % Para la primera fila no hay ratio (no existe L/2)
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t -\t\t %.8f\t %.8e\t -\n', ...
                2^i, L, Q_trap, E_trap, Q_simp, E_simp);
    else
        % Calculamos la relación E_L / E_{L/2}
        ratio_trap = E_trap / E_trap_prev;
        ratio_simp = E_simp / E_simp_prev;
        
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t %.6f\t %.8f\t %.8e\t %.6f\n', ...
                2^i, L, Q_trap, E_trap, ratio_trap, Q_simp, E_simp, ratio_simp);
    end
    
    % Actualizamos los errores para la siguiente iteración
    E_trap_prev = E_trap;
    E_simp_prev = E_simp;
    
end
printf("=========================================================================================\n");
f2=@(x) 1./(1+x.^2);
I_exacta_2=2*atan(5);
a2=-5;
b2=5;
% Variables para almacenar los errores de la iteración anterior (L/2)
E_trap_prev2=0;
E_simp_prev2= 0;
fprintf('h\t L\t Q2_L (Trapecio)\t E_L_trap\t Ratio_trap\t Q3_L (Simpson)\t E_L_simp\t Ratio_simp\n');
fprintf('-------------------------------------------------------------------------------------------------------------------------\n');
for i = 1:12
    % Calculamos el paso h y la cantidad de subintervalos L
    h = 1 / (2^i);
    L = (b2 - a2) / h;
    % 1. Regla del Trapecio Compuesta (n = 2 puntos)
    Q_trap = intNCcompuesta(f2, a2, b2, L, 2);
    E_trap = abs(I_exacta_2 - Q_trap);
    
    % 2. Regla de Simpson Compuesta (n = 3 puntos)
    Q_simp = intNCcompuesta(f2, a2, b2, L, 3);
    E_simp = abs(I_exacta_2 - Q_simp);
  
    % 3. Cálculos de Ratios e Impresión de la Tabla
    if i == 1
        % Para la primera fila no hay ratio (no existe L/2)
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t -\t\t %.8f\t %.8e\t -\n', ...
                2^i, L, Q_trap, E_trap, Q_simp, E_simp);
    else
        % Calculamos la relación E_L / E_{L/2}
        ratio_trap = E_trap / E_trap_prev_2;
        ratio_simp = E_simp / E_simp_prev_2;
        
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t %.6f\t %.8f\t %.8e\t %.6f\n', ...
                2^i, L, Q_trap, E_trap, ratio_trap, Q_simp, E_simp, ratio_simp);
    end
    
    % Actualizamos los errores para la siguiente iteración
    E_trap_prev_2 = E_trap;
    E_simp_prev_2 = E_simp;
end

printf("=========================================================================================\n");
f3=@(x) abs(x.^(3/2));
a3=0;
b3=5;
I_exacta_3=10*sqrt(5);  
% Variables para almacenar los errores de la iteración anterior (L/2)
E_trap_prev3=0;
E_simp_prev3= 0;
fprintf('h\t L\t Q2_L (Trapecio)\t E_L_trap\t Ratio_trap\t Q3_L (Simpson)\t E_L_simp\t Ratio_simp\n');
fprintf('-------------------------------------------------------------------------------------------------------------------------\n');
for i = 1:12
    % Calculamos el paso h y la cantidad de subintervalos L
    h = 1 / (2^i);
    L = (b3 - a3) / h;
    % 1. Regla del Trapecio Compuesta (n = 2 puntos)
    Q_trap = intNCcompuesta(f3, a3, b3, L, 2);
    E_trap = abs(I_exacta_3 - Q_trap);
    
    % 2. Regla de Simpson Compuesta (n = 3 puntos)
    Q_simp = intNCcompuesta(f3, a3, b3, L, 3);
    E_simp = abs(I_exacta_3 - Q_simp);
  
    % 3. Cálculos de Ratios e Impresión de la Tabla
    if i == 1
        % Para la primera fila no hay ratio (no existe L/2)
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t -\t\t %.8f\t %.8e\t -\n', ...
                2^i, L, Q_trap, E_trap, Q_simp, E_simp);
    else
        % Calculamos la relación E_L / E_{L/2}
        ratio_trap = E_trap / E_trap_prev_3;
        ratio_simp = E_simp / E_simp_prev_3;
        
        fprintf('1/%d\t %d\t %.8f\t\t %.8e\t %.6f\t %.8f\t %.8e\t %.6f\n', ...
                2^i, L, Q_trap, E_trap, ratio_trap, Q_simp, E_simp, ratio_simp);
    end
    
    % Actualizamos los errores para la siguiente iteración
    E_trap_prev_3 = E_trap;
    E_simp_prev_3 = E_simp;
end

% LOGICA Y OBJETIVOS DE ESTE EJERCICIO:
%
% 1. CONVERGENCIA: 
%    Comprobar empíricamente que al aumentar L (duplicando la cantidad de 
%    subintervalos en cada iteración), el tamaño del paso 'h' se achica a 
%    la mitad y el error matemático de la integral tiende a cero 
%
% 2. ORDEN DE CONVERGENCIA (Para qué sirven las columnas "Ratio"):
%    Buscamos demostrar matemáticamente LA VELOCIDAD a la que mejora cada método:
%    - Trapecio (Orden 2): Como su error es O(h^2), al achicar 'h' a la mitad, 
%      su error debe caer a la cuarta parte. El Ratio demuestra que tiende a 0.25 
%    - Simpson (Orden 4): Como su error es O(h^4), al achicar 'h' a la mitad, 
%      su error colapsa muchísimo más rápido. El Ratio demuestra que tiende a 0.0625 
%
% 3. EL LÍMITE DE LA MÁQUINA (El final de la tabla):
%    Demostrar que "infinitos puntos" no es lo mejor. Para un L gigante, la 
%    computadora tiene que hacer decenas de miles de sumas minúsculas. El error 
%    matemático desaparece, pero se empieza a acumular "basura binaria" (error 
%    de redondeo de la máquina), impidiendo que el error baje de ~10^-15 
