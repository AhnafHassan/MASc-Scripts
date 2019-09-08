function output= Band_Pass_Filter(LowerCutOff,HigherCutOff,Fs,Signal)
% Band-pass filtering function to extract EEG frequency bands

FilterOrder= 2;

[d1, c1] = butter(FilterOrder, [1/(Fs/2) 35/(Fs/2)], 'bandpass');
output = filtfilt(d1, c1, Signal);


% d1 = fir1(5, 1/(Fs/2), 'high');
% output = filtfilt(d1, 1, output);

% % FIR filter
% W1= 1 *2/Fs; W2= 35 *2/Fs; 
% d  = fir1(500,[W1 W2],'bandpass');
% output = filtfilt(d, 1, Signal);