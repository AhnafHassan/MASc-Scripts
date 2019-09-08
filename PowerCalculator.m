function [AvgPower,RelativePower]=PowerCalculator(Signal,Fs)
% Delta= 0-4 Hz
% Theta= 4-8 Hz
% Alpha= 8-13 Hz
% Beta= 13-30 Hz
% Gamma= 30-100 Hz
AvgPower=zeros(1,5); RelativePower=AvgPower; 
n= length(Signal);  w = hamming(Fs);
[P,f] = pwelch(Signal,w,[],n,Fs);


% Delta
AvgPower(1)=bandpower(P,f,[1 4],'psd');   
% AvgPower(1)= mean(P(find(f>=1 & f<4)));


% Theta
AvgPower(2)=bandpower(P,f,[4 8],'psd');  
% AvgPower(2)= mean(P(find(f>=4 & f<8)));


% Alpha
AvgPower(3)=bandpower(P,f,[8 13],'psd'); 
% AvgPower(3)= mean(P(find(f>=8 & f<13)));


% Beta
AvgPower(4)=bandpower(P,f,[13 30],'psd');   
% AvgPower(4)= mean(P(find(f>=13 & f<30)));


% Gamma
AvgPower(5)=bandpower(P,f,[1 30],'psd');  
% AvgPower(5)= mean(P(find(f>=1 & f<30)));


AvgPower= AvgPower./AvgPower(5); 
% AvgPower= AvgPower./sum(AvgPower(1:4)); 


% TotalPower = bandpower(P,f,[1 30],'psd');


% % Delta
% RelativePower(1)=bandpower(P,f,[1 4],'psd')/TotalPower; 
% 
% % Theta
% RelativePower(2)=bandpower(P,f,[4 8],'psd')/TotalPower; 
% 
% % Alpha
% RelativePower(3)=bandpower(P,f,[8 13],'psd')/TotalPower; 
% 
% % Beta
% RelativePower(4)=bandpower(P,f,[13 30],'psd')/TotalPower; 

% Gamma
% RelativePower(5)=AvgPower(5)/TotalPower; 


% AvgPower= AvgPower./AvgPower(5); 

