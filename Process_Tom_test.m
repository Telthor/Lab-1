
X_Deco = load('-mat', 'TomoData_Xdeco');
X_Pure = load('-mat', 'TomoData_Xpure');
Y_Pure = load('-mat', 'TomoData_Ypure');
Z_Pure = load('-mat', 'TomoData_Zpure');


% Create new variables in the base workspace from those fields.
% vars = fieldnames(newData1);
%for i = 1:length(vars)
%    assignin('base', vars{i}, newData1.(vars{i}));
%end

[xr_x, xr_y, xr_z] = Bloch_Vec(X_Pure)
[yr_x, yr_y, yr_z] = Bloch_Vec(Y_Pure)
[zr_x, zr_y, zr_z] = Bloch_Vec(Z_Pure)
[dr_x, dr_y, dr_z] = Bloch_Vec(X_Deco)

xr = [xr_x, xr_y, xr_z]
yr = [yr_x, yr_y, yr_z]
zr = [zr_x, zr_y, zr_z]
dr = [dr_x, dr_y, dr_z]

r_norm_x = xr*1/(norm(xr))
r_norm_y = yr*1/(norm(yr))
sig_i = [1 , 0; 0,1]
sig_x = [0, 1;1,0]
sig_y = [0 -i; i, 0]
sig_z = [1 0; 0 -1]

[x_rho] = Density_mat(xr, norm(xr))
[y_rho] = Density_mat(yr, norm(xr))
[z_rho] = Density_mat(zr, norm(xr))
[d_rho] = Density_mat(dr, norm(xr))


