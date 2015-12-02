function[full_data_I, full_data_Q, timedata] = Data_Capture(data)


load(data{1});

[xaxispoints,yaxispoints,signalmaindata] = ConvertData(MAIN);


%Load in phase and out of phase data as well as timedata
full_data_I_1 = full_data.data{1};
full_data_Q_1 = full_data.data{2};
timedata = xaxispoints{1,3};
[m,n] = size(timedata)

timedata = (linspace(1, m, m))';


%Take the mean of each shot

full_data_I = mean(full_data_I_1, 4);
full_data_Q = mean(full_data_Q_1, 4);

%Take the data for each separate state (identity and rotated) and assign to
%a new variable

% zero_p = full_data_Q(:,:,1);
% one_p = full_data_Q(:,:,2);
% yplus_p = full_data_Q(:,:,3);
% xplus_p = full_data_I(:,:,4);
% zero_rot = full_data_Q(:,:,5);
% one_rot = full_data_Q(:,:,6);
% yplus_rot = full_data_Q(:,:,7);
% xplus_rot = full_data_I(:,:,8);

% for i = 1:8
%     figure
%     hold on
%     plot(timedata, full_data_I(:,:,i));
%     plot(timedata, full_data_Q(:,:,i));
%     hold off


end

