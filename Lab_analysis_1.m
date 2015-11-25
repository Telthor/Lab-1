State_calibration = {'008_2311-StateCalibration.mat'};
State_cal = load(State_calibration{1});

%[xaxispoints,yaxispoints,signalmaindata] = ConvertData(MAIN);

full_data_I = full_data.data{1};
full_data_Q = full_data.data{2};

%Take the mean of each shot

full_data_I = mean(full_data_I, 4);
full_data_Q = mean(full_data_Q, 4);

full_data_I(2,1,1)

plot(timedata,full_data_I(:,1,1))
hold on
plot(timedata,full_data_Q(:,1,1))



fit_1 = fit(timedata(1400:1600),full_data_Q(1400:1600,:,1),'gauss1')
plot(fit_1)

hold off

