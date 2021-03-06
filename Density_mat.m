function [rho] = Density_mat(r)
% Normalise the vector
norm(r)
r_new = (1/norm(r))*r

%Pauli Matrices
sig_i = [1 , 0; 0,1];
sig_x = [0, 1;1,0];
sig_y = [0 -i; i, 0];
sig_z = [1 0; 0 -1];

rho = (1/2)*(sig_i + r_new(1)*sig_x + r_new(2)*sig_y + r_new(3)*sig_z);