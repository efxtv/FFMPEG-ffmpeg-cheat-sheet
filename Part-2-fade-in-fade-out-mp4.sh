dur=$(ffmpeg -i $2 2>&1 |grep -oP "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{2}"|sed 's#:# #g'|awk '{print $1" "$2"*60""+"$3}'|sed 's#\.# #g'|grep "00 "|awk '{print "echo $(("$2"-TTT))"}'|sed "s#TTT#$3#g"|bash)
echo "ffmpeg -i $2 -vf 'fade=t=in:st=0:d=$3,fade=t=out:st=$dur:d=$3' -profile:v main -video_track_timescale 24k -c:a copy OUT-final.mp4"|bash
