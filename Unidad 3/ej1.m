A=[3/4 1/6;1/4 1/4];
d=eig(A);
disp('los autovalores son: ');
disp(d);
#radio espectral es el mayor valor absoluto de los autovalores
radio_espectral=max(abs(d));
disp('el radio espectral es: ');
disp(radio_espectral);
