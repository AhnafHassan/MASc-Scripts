function ChopVideos(Vid,Start,End,FolderNo,OPLocation)
% Cut down video snippets from a larger video
Vid.CurrentTime= Start;
ii= 1; str= ['E:\Subject 02\Video\Garbage',num2str(FolderNo),'\'];

while Vid.CurrentTime<=End
    img = readFrame(Vid);
    filename = [str,num2str(ii),'.jpg'];
    imwrite(img,filename)
    ii = ii+1;
end

fprintf('Images successfully converted. Now writing in a video file....\n');

N= ii-1; 
outputVideo = VideoWriter(OPLocation);
outputVideo.FrameRate = Vid.FrameRate;
open(outputVideo);

for j = 1:N
   img = imread([str, num2str(j),'.jpg']);
   writeVideo(outputVideo,img);
end

close(outputVideo);

fprintf('ChopVideos Exits.........\n')





