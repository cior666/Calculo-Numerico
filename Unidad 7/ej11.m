%en este tambien hay que despejar variables del estilo y''
addpath('C:\Users\conra\OneDrive\Desktop\Facu Conrado\TERCER AÑO\Calculo numérico\2026\Algoritmos');
f = @(t,x) [
    x(2);
    (2*x(2))/t - (2*x(1))/t^2 + t*log(t)
];
y_exacta = @(t) (7/4)*t + 0.5*t.^3.*log(t) - (3/4)*t.^3;

x0 = [1;0];
hs = [0.2 0.1 0.05];

printf("h\t\tError maximo\n");
for k=1:length(hs)
    h = hs(k);
    L = (2-1)/h;
    [t,x] = adams_bashfort(f,[1 2],x0,L);
    y_num = x(:,1);
    y_ex = y_exacta(t);
    err_max = max(abs(y_num - y_ex));
    printf("%.2f\t\t%.3e\n",h,err_max);
endfor
