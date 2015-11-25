State_calibration = {'008_2311-StateCalibration.mat'};
load(State_calibration{1});

[xaxispoints,yaxispoints,signalmaindata] = ConvertData(MAIN);

full_data_I = full_data.data{1}; % In phase data
full_data_Q = full_data.data{2}; % Out of phase data

% Then the data corresponding to the time axis is:
timedata = xaxispoints{1,3} % From ConvertData(MAIN) - time data doesn't seem to be stored in full_data?
% And the overall averaged I and Q channels are:
Idatamain = signalmaindata{1,3}; % Averaged data, not very useful
Qdatamain = signalmaindata{2,3}; % Averaged data, not very useful

% Now, the full_data.data{} is an array with four indices:
% [xaxisdata, yaxisdata, phase cycle, shot]
% We're going to want to average over all shots for each cycle,
% i.e. take the mean over the 4th index:
full_data_I = mean(full_data_I,4); % Average of each shot
full_data_Q = mean(full_data_Q,4); % Average of each shot

% So now full_dataI (and Q) is an array with three indices:
% [actual data, yaxisdata, phase cycle]
% Unless you were sweeping in the Y axis e.g when setting the acquisition phase, this will just be a column of size 1.
% So, for example, we can get a 1-column array of our data by specifying which cycle of the experiment we want to look at:
phasecycle = 2;
phasecycledataI = full_data_I(:,:,phasecycle);

% Now to access all the data (t, I, Q) that we are expecting to look at for
% each phase of each experiment this would correspond to:
timedata = timemaindata{1,3}; % Time axis, first column of previous data sets
Idata = full_data_I(:,:,phasecycle); % In-phase data for phasecycle, second column of previous data sets
Qdata = full_data_Q(:,:,phasecycle); % Out-phase data for phasecycle, third column of previous data sets

% So by loading different files at the start and pointing to different
% phasecycle indices inside full_data you should be able to access the same
% sort of data as with the examples we've been working with.

% As an example, to get a plot for the experiment similar to what GARII
% would show, we could do:
phasecycle = 6;
timedata = timemaindata{1,3};
Idata = full_data_I(:,:,phasecycle);
Qdata = full_data_Q(:,:,phasecycle);
plot(timedata, Idata, timedata, Qdata)