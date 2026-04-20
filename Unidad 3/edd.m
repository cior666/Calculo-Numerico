function es_edd = edd(A)
    % Devuelve 1 si A es Estrictamente Diagonal Dominante, 0 en caso contrario.
    
    [n, m] = size(A);
    
    % Verificamos que sea cuadrada
    if n ~= m
        disp('La matriz no es cuadrada. No puede ser EDD.');
        es_edd = 0;
        return;
    end
    
    es_edd = 1; % Asumimos que es EDD hasta demostrar lo contrario
    
    for i = 1:n
        % Extraemos el valor absoluto del elemento de la diagonal
        diag_val = abs(A(i,i));
        
        % Sumamos los valores absolutos de toda la fila
        suma_fila = sum(abs(A(i,:)));
        
        % Al total de la fila le restamos el de la diagonal para obtener la suma del resto
        suma_resto = suma_fila - diag_val;
        
        % Evaluamos la condición EDD
        if diag_val <= suma_resto
            % Si NO es estrictamente mayor, entonces ya sabemos que no es EDD
            printf('Falla en la fila %d: |%g| NO es mayor que %g\n', i, diag_val, suma_resto);
            es_edd = 0;
            return; % Salimos inmediatamente, no hace falta revisar las demás
        end
    end
    
    disp('La matriz SI es Estrictamente Diagonal Dominante (EDD).');
endfunction