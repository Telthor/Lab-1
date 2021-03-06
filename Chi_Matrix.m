function [Chi] = Chi_Matrix(rho_0, rho_1, rho_y, rho_x)

sig_i = [1 , 0; 0,1];
sig_x = [0, 1;1,0];
sig_y = [0 -i; i, 0];
sig_z = [1 0; 0 -1];

Lamda = (1/2)*[sig_i sig_x; sig_x -sig_i]

rho_2 = rho_x + i*rho_y - (1 + i)*(rho_0 + rho_1)/2
rho_3 = rho_x - i*rho_y - (1 - i)*(rho_0 + rho_1)/2


x = [rho_0 rho_2; rho_3 rho_1]

Chi = Lamda*(x*Lamda)
Chi = Chi/(norm(Chi,1))
real(Chi)
imag(Chi)
subplot(1,2,1)
bar3(real(Chi))
subplot(1,2,2)
bar3(imag(Chi))

end