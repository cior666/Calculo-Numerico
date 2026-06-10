function cifras = cifras_exactas_visual(xaprox,xreal)
    s1 = strrep(sprintf('%.15f',xaprox),'.',''); %convierto a string y le saco el punto o la coma del resultado
    s2 = strrep(sprintf('%.15f',xreal),'.','');
    cifras = 0; %inicio contador
%itero y cuando coinciden sumo 1
    for i = 1:min(length(s1),length(s2))

        if s1(i) == s2(i)
            cifras = cifras + 1;
        else
            break
        endif
    endfor
endfunction