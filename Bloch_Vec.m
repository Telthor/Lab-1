function [r] = Bloch_Vec(Data)

% Extract the data from the file and assign each column to a variable
col_1 = Data.data(:,1);
col_2 = Data.data(:,2);
col_3 = Data.data(:,3);
figure
% Plot the data
plot(col_1,col_2)

data_values = mat2dataset(Data.data);

size(data_values);
%Select the appropriate data for each bloch vector value
xdata = double(data_values(1:20000, [1,2]));
zdata = double(data_values(20001:40000, [1,2]));
ydata = double(data_values(1:40000, [1,3]));

hold on

plot(col_1,col_3)

% Apply a Gaussian fit to both sets of data
% fun_x = fit(col_1,col_2,'gauss1')
% plot(fun_x)
% fun_x_2 = fit(col_1, col_3,'gauss1')
% plot(fun_x_2)

% Apply a Gaussian fit to the three data sets corresponding to Bloch
% coefficients x, y, z


x_fun = fit(xdata(:,1), xdata(:,2), 'gauss1')
z_fun = fit(zdata(:,1), zdata(:,2), 'gauss1')
y_fun = fit(ydata(:,1), ydata(:,2), 'gauss1')

plot(x_fun)
plot(z_fun)
plot(y_fun)


%Extract the coefficients from the Gaussians
% xd_coeffs_1 = coeffvalues(fun_x)
% xd_coeffs_2 = coeffvalues(fun_x_2)

x_coeffs = coeffvalues(x_fun)
z_coeffs = coeffvalues(z_fun)
y_coeffs = coeffvalues(y_fun)

%Division by root 2 is due to different matlab definition of the Gaussian
%function

amp_x = x_coeffs(1)
mean_x = x_coeffs(2)
sd_x = x_coeffs(3)/(sqrt(2))

amp_z = z_coeffs(1)
mean_z = z_coeffs(2)
sd_z = z_coeffs(3)/(sqrt(2))

amp_y = y_coeffs(1)
mean_y = y_coeffs(2)
sd_y = y_coeffs(3)/(sqrt(2))

% amp_x = xd_coeffs_1(1)
% mean_x = xd_coeffs_1(2)
% sd_x = xd_coeffs_1(3)/(sqrt(2))
% amp_z = xd_coeffs_1(4)
% mean_z = xd_coeffs_1(5)
% sd_z = xd_coeffs_1(6)/(sqrt(2))
% amp_y = xd_coeffs_2(1)
% mean_y = xd_coeffs_2(2)
% sd_y = xd_coeffs_2(3)/(sqrt(2))



% Find integration limits using the Gaussian fits
x_start = abs(round(mean_x - round((2*sqrt(log(2)))*sd_x)))

x_finish = abs(round(mean_x + round((2*sqrt(log(2)))*sd_x)))

z_start = abs(round(mean_z - round((2*sqrt(log(2)))*sd_z)))

z_finish = abs(round(mean_z + round((2*sqrt(log(2)))*sd_z)))

y_start = abs(round(mean_y - round((2*sqrt(log(2)))*sd_y)))

y_finish = abs(round(mean_y + round((2*sqrt(log(2)))*sd_y)))


if abs(amp_x) > 6
    r_x = trapz(col_1(x_start:x_finish),col_2(x_start:x_finish))
else
    r_x = 0
end
if abs(amp_z) > 6
    r_z = trapz(col_1(z_start:z_finish),col_2(z_start:z_finish))
else
    r_z = 0
end
if abs(amp_y) > 6
    r_y = trapz(col_1(y_start:y_finish),col_3(y_start:y_finish))
else
    r_y = 0
end
% Integrate and find Bloch vector values from data
% r_x = trapz(col_1(x_start:x_finish),col_2(x_start:x_finish))
% r_y = trapz(col_1(y_start:y_finish),col_3(y_start:y_finish))
% r_z = trapz(col_1(z_start:z_finish),col_2(z_start:z_finish))
r = [r_x, r_y, r_z]
end

