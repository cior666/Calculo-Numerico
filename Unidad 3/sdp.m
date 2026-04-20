function es_sdp = sdp(A)
    % Devuelve 1 si A es Simétrica Definida Positiva, 0 en caso contrario.
    
    [n, m] = size(A);
    tol = 1e-10; % Tolerancia computacional para errores de redondeo de Octave
    
    % 1. Verificamos que sea cuadrada
    if n ~= m
        disp('La matriz no es cuadrada. No puede ser SDP.');
        es_sdp = 0;
        return;
    end
    
    % 2. Verificamos Simetría
    % Comparamos la matriz con su transpuesta (A')
    if norm(A - A', inf) > tol
        disp('La matriz NO es simetrica.');
        es_sdp = 0;
        return;
    end
    
    % 3. Verificamos que sea Definida Positiva
    % Calculamos todos los autovalores de la matriz
    autovalores = eig(A);
    
    % Revisamos si hay algún autovalor menor o igual a cero
    for i = 1:n
        if autovalores(i) <= 0
            printf('La matriz NO es definida positiva (tiene autovalor <= 0: %g).\n', autovalores(i));
            es_sdp = 0;
            return;
        end
    end
    
    % Si pasó todas las pruebas, entonces es SDP
    disp('La matriz SI es Simetrica Definida Positiva (SDP).');
    es_sdp = 1;
    
endfunction