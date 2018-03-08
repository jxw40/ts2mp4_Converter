# !/bin/bash
# convert many orderly .ts to a single .mp4

# put this sh in the same folder as your .ts files
# command:  chmod +755 ./ts2mp4.sh
#           ./ts2mp4.sh endPos fileName

# if your .ts start with 0.ts, end with 55.ts, you can type following command 
# to convert your .ts files to "myVideo.mp4"
# example: ./ts2mp4.sh 55 myVideo.mp4

startPos=0  # if your .ts start with 1.ts, change 0 to 1
endPos=$1
for ((i=$startPos;i<=$endPos;i++));
do
    echo file \'$i.ts\'; 
done > myIndex.txt

ffmpeg -f concat -i my.txt -c copy all.ts

ffmpeg -i all.ts -acodec copy -vcodec copy -bsf aac_adtstoasc $2
