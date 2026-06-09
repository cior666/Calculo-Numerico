function analizar_metodo(nombre, a, b)
    % Recibe: 
    % a = coeficientes a_j (desde j=0 hasta p)
    % b = coeficientes b_j (desde j=-1 hasta p)
    p = length(a) - 1;
    
    printf("\n=== Metodo: %s ===\n", nombre);

    % =====================================================================
    % 1. FORMULAS DE CONSISTENCIA [cite: 633]
    % Condicion 1: sum(a_j) == 1
    % Condicion 2: -sum(j * a_j) + sum(b_j) == 1
    % =====================================================================
    sum_a = sum(a);
    j_a = 0:p;
    sum_ja = sum(j_a .* a);
    sum_b = sum(b);
    
    % Verificamos usando una tolerancia por errores de redondeo de la maquina
    consistente = (abs(sum_a - 1) < 1e-9) && (abs(-sum_ja + sum_b - 1) < 1e-9);
    
    if consistente, printf("Consistencia: SI\n");
    else,           printf("Consistencia: NO\n"); endif

    % =====================================================================
    % 2. FORMULA DE ORDEN [cite: 633]
    % Para ser orden m debe verificar (para k=2,3,...,m):
    % sum( (-j)^k * a_j ) + k * sum( (-j)^(k-1) * b_j ) == 1
    % =====================================================================
    orden = 1;
    if consistente
        j_b = -1:p;
        for k = 2:10 % Probamos teoricamente hasta orden 10
            term1 = sum(((-j_a).^k) .* a);
            term2 = k * sum(((-j_b).^(k-1)) .* b);
            
            if abs(term1 + term2 - 1) < 1e-9
                orden = k;
            else
                break; % Si falla para un k, el orden es el anterior
            endif
        endfor
    else
        orden = 0;
    endif
    printf("Orden: %d\n", orden);

    % =====================================================================
    % 3. FORMULA DE ESTABILIDAD (CONDICION DE LA RAIZ) [cite: 633, 634]
    % Polinomio: rho(r) = r^(p+1) - sum( a_j * r^(p-j) )
    % Regla: Raices con modulo <= 1. Si tienen modulo 1, deben ser simples.
    % =====================================================================
    % En Octave, 'roots' espera los coeficientes del polinomio decrecientes
    rho_coeffs = [1, -a]; 
    raices = roots(rho_coeffs);
    magnitudes = abs(raices);
    
    estable = true;
    if any(magnitudes > 1 + 1e-9)
        estable = false;
        printf("Estabilidad: INESTABLE (Raices mayores a 1)\n");
    else
        % Contamos cuantas raices tienen magnitud exactamente igual a 1
        raices_mod_1 = raices(abs(magnitudes - 1) < 1e-5);
        if length(raices_mod_1) == 1 && abs(raices_mod_1(1) - 1) < 1e-5
            printf("Estabilidad: FUERTEMENTE ESTABLE (Unica raiz mod 1 es r=1)\n");
        else
            printf("Estabilidad: DEBILMENTE ESTABLE (Raices extra de mod 1)\n");
        endif
    endif

    % =====================================================================
    % 4. FORMULA DE CONVERGENCIA [cite: 635]
    % Teorema: Convergente <=> Estable (condicion raiz) + Consistente
    % =====================================================================
    if consistente && estable
        printf("Convergencia: SI (Es consistente y estable)\n");
    else
        printf("Convergencia: NO\n");
    endif
endfunction