

State_calibration = {'009_2311-Xpi rotation.mat'};
load(State_calibration{1});

[xaxispoints,yaxispoints,signalmaindata] = ConvertData(MAIN);

full_data_I = full_data.data{1};
full_data_Q = full_data.data{2};
timedata = xaxispoints{1,3};

%Take the mean of each shot

full_data_I = mean(full_data_I, 4);
full_data_Q = mean(full_data_Q, 4);

full_data_I(2,1,1)

plot(timedata,full_data_I(:,1,4))
hold on
%plot(timedata,full_data_Q(:,1,4))

size(full_data_I(1,1,:))

fit_1 = fit(timedata(1400:1600),full_data_Q(1400:1600,:,2),'gauss1')
plot(fit_1)

hold off

