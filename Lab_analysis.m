
[data_I, data_Q, timedata] = Data_Capture({'011_2311-XYpi rotation.mat'});


[full_data_I, full_data_Q] = get_offset(data_I, data_Q);
size(timedata)

% for i = 1:8
%     figure
%     hold on
%     plot(timedata, full_data_I(:,:,i));
%     plot(timedata, full_data_Q(:,:,i));
%     hold off
% end

[r0, r1, ry, rx] = get_bloch(full_data_I, full_data_Q, timedata)

[rho0] = Density_mat(r0)
[rho1] = Density_mat(r1)
[rhoy] = Density_mat(ry)
[rhox] = Density_mat(rx)

[matrix] = Chi_Matrix(rho0, rho1, rhoy, rhox)

[[0 0 0 0];[0 0 0 0];[0 0 1 0];[0 0 0 0]]

Fidelity(matrix, [[0 0 0 0];[0 0 0 0];[0 0 0 0];[0 0 0 1]])

hold off