clear all; close all; clc;
KSS= [4 5 6 7 8 8 7 7 5 4];
Missed= []; PerMissed= []; AvgRT= zeros(1,10); 
for BlockNo= 1:10
    RT= ReactionTime(BlockNo);
    
    TempRT= RT; TempRT(find(RT<0))= [];
    AvgRT(BlockNo)= mean(TempRT); 
    figure(BlockNo);
    bar(RT);
    str= sprintf('Block No. %d',BlockNo);
    title(str);
    ylabel('Reaction Time in Seconds'); xlabel('No of Red Cross');
    set(gca,'fontsize',24);
    Missed= [Missed length(find(RT<0))];
    PerMissed= [PerMissed (100*Missed(BlockNo)/length(RT))]; 
    fprintf('Percentage of missed red crosses= %f\n', PerMissed(BlockNo));
end

figure(11); 
bar(Missed,'r'); xlabel('Block Number'); ylabel('Number of Missed Red Crosses'); 
set(gca,'fontsize',24);
figure(12);
bar(PerMissed,'k'); xlabel('Block Number'); ylabel('Percentage of Missed Red Crosses'); 
set(gca,'fontsize',24);

figure(13);
bar(AvgRT,'b'); xlabel('Block Number'); ylabel('Average Reaction Time'); 
set(gca,'fontsize',24);