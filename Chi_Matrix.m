function [Chi] = Chi_Matrix(rho_1, rho_2, rho_3, rho_4)

sig_i = [1 , 0; 0,1];
sig_x = [0, 1;1,0];
sig_y = [0 -i; i, 0];
sig_z = [1 0; 0 -1];

Lamda = (1/2)*[sig_i sig_x; sig_x -sig_i]

x = [rho_1 rho_2; rho_3 rho_4]

Chi = Lamda*(x*Lamda)
real(Chi)
imag(Chi)
subplot(1,2,1)
bar3(real(Chi))
subplot(1,2,2)
bar3(imag(Chi))

end