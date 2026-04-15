function L = cholesky(A)
    % Verifica que la matriz sea cuadrada
    n = size(A, 1);
    
    % Inicializamos la matriz L con ceros
    L = zeros(n, n);
    
    for j = 1:n
        % 1. Calculamos el elemento de la diagonal principal (L_jj)
        % Se usa el producto escalar (vector * vector transpuesta) en lugar de un lazo 'for k'
        suma_diag = L(j, 1:j-1) * L(j, 1:j-1)';
        L(j,j) = sqrt(A(j,j) - suma_diag);
        
        % 2. Calculamos los elementos por debajo de la diagonal (L_ij)
        if j < n
            % Operamos sobre todo el bloque de la columna 'j' de un solo golpe
            suma_col = L(j+1:n, 1:j-1) * L(j, 1:j-1)';
            L(j+1:n, j) = (A(j+1:n, j) - suma_col) / L(j,j);
        endif
    endfor
endfunction