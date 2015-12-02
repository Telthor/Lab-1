function [zero_out, one_out, Y_out, X_out] = get_bloch(full_data_I, full_data_Q, timedata)

%if xpi set limits to 350:950 and 2750:3290
%if others set limits to 350:950 and 2750:3290


nz = (trapz(full_data_Q(2750:3290,:,1)))
%  + abs(trapz(full_data_Q(2750:3290,:,2))))
ny = (trapz(full_data_Q(350:950,:,3)))
nx = (trapz(full_data_I(350:950,:,4)))

zero_out = [(1/nx)*(trapz(full_data_I(350:950,:,5))), (1/ny)*(trapz(full_data_Q(350:950,:,5))), (1/nz)*(trapz(full_data_Q(2750:3290,:,5)))]
one_out = [(1/nx)*(trapz(full_data_I(350:950,:,6))), (1/ny)*(trapz(full_data_Q(350:950,:,6))), (1/nz)*(trapz(full_data_Q(2750:3290,:,6)))]
Y_out = [(1/nx)*(trapz(full_data_I(350:950,:,7))), (1/ny)*(trapz(full_data_Q(350:950,:,7))), (1/nz)*(trapz(full_data_Q(2750:3290,:,7)))]
X_out = [(1/nx)*(trapz(full_data_I(350:950,:,8))), (1/ny)*(trapz(full_data_Q(350:950,:,8))), (1/nz)*(trapz(full_data_Q(2750:3290,:,8)))]


% 
zeropure = full_data_Q(2750:3290,1,1)
onepure = full_data_Q(2750:3290,1,2)
ypure = full_data_Q(350:950,1,3)
xpure = full_data_I(350:950,1,4)

zero_fun = fit(timedata(2750:3290), abs(zeropure), 'gauss1')
one_fun = fit(timedata(2750:3290), abs(onepure), 'gauss1')
x_fun = fit(timedata(350:950), abs(xpure), 'gauss1')
y_fun = fit(timedata(350:950), abs(ypure), 'gauss1')

hold on

for i = 1:4
    
    plot(timedata, full_data_I(:,:,i));
    plot(timedata, full_data_Q(:,:,i));

end
% 
% plot(x_fun)
% plot(zero_fun)
% plot(one_fun)
% plot(y_fun)
% 
% zero_coeffs = coeffvalues(zero_fun)
% one_coeffs = coeffvalues(one_fun)
% x_coeffs = coeffvalues(x_fun)
% y_coeffs = coeffvalues(y_fun)
% 
% 
% amp_0 = zero_coeffs(1)
% mean_0 = zero_coeffs(2)
% sd_0 = zero_coeffs(3)/(sqrt(2))
% 
% amp_1 = one_coeffs(1)
% mean_1 = one_coeffs(2)
% sd_1 = one_coeffs(3)/(sqrt(2))
% 
% amp_x = x_coeffs(1)
% mean_x = x_coeffs(2)
% sd_x = x_coeffs(3)/(sqrt(2))
% 
% amp_y = y_coeffs(1)
% mean_y = y_coeffs(2)
% sd_y = y_coeffs(3)/(sqrt(2))
% 
% 
% 
% zero_start = abs(round(mean_0 - round((2*sqrt(log(2)))*sd_0)))
% 
% zero_finish = abs(round(mean_0 + round((2*sqrt(log(2)))*sd_0)))
% 
% one_start = abs(round(mean_1 - round((2*sqrt(log(2)))*sd_1)))
% 
% one_finish = abs(round(mean_1 + round((2*sqrt(log(2)))*sd_1)))
% 
% x_start = abs(round(mean_x - round((2*sqrt(log(2)))*sd_x)))
% 
% x_finish = abs(round(mean_x + round((2*sqrt(log(2)))*sd_x)))
% 
% y_start = abs(round(mean_y - round((2*sqrt(log(2)))*sd_y)))
% 
% y_finish = abs(round(mean_y + round((2*sqrt(log(2)))*sd_y)))
% 
% nr_z = 0.5*((abs(trapz(timedata(zero_start:zero_finish),full_data_Q(zero_start:zero_finish,1,1))))+abs(trapz(timedata(one_start:one_finish),full_data_Q(one_start:one_finish,1,2))))
% nr_x = abs(trapz(timedata(x_start:x_finish),full_data_I(x_start:x_finish,1,4)))
% nr_y = abs(trapz(timedata(y_start:y_finish),full_data_Q(y_start:y_finish,1,3)))
% 
% hold off



end