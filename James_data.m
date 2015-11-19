%James dummy data

xpure = load('-mat', 'DummyData_Xpure')
ypure = load('-mat', 'DummyData_Ypure')
zpure = load('-mat', 'DummyData_Zpure')
Rho_1 = load('-mat', 'DummyData1_rho1')
Rho_m = load('-mat', 'DummyData1_rhom')
Rho_p = load('-mat', 'DummyData1_rhop')
Rho_4 = load('-mat', 'DummyData1_rho4')

rx = Bloch_Vec(xpure)
(1/norm(rx))*rx
ry = Bloch_Vec(ypure)
(1/norm(ry))*ry
rz = Bloch_Vec(zpure)
r1 = Bloch_Vec(Rho_1)
rm = Bloch_Vec(Rho_m)
rp = Bloch_Vec(Rho_p)
r4 = Bloch_Vec(Rho_4)

normx = (norm(rx))
normy = (norm(ry))
normz = (norm(rz))
rho_1 = Density_mat(r1, normx, normy, normz)
rho_m = Density_mat(rm, normx, normy, normz)
rho_p = Density_mat(rp, normx, normy, normz)
rho_4 = Density_mat(r4, normx, normy, normz)
%rho_4 = (1/2)*eye(2)

rho_2 = rho_p + i*rho_m - (1 + i)*(rho_1 + rho_4)/2
rho_3 = rho_p - i*rho_m - (1 - i)*(rho_1 + rho_4)/2

subplot(2,2,1)
bar3(rho_1)
subplot(2,2,2)
bar3(rho_m)
subplot(2,2,3)
bar3(rho_p)
subplot(2,2,4)
bar3(rho_4)

Chi = Chi_Matrix(rho_1, rho_2, rho_3, rho_4)

[V,D] = eig(Chi)

