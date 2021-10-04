#audi
#$1=audio.mp3
#$2=3
dur=$(ffmpeg -i $1 2>&1 |grep -oP "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{2}"|sed 's#:# #g'|awk '{print $1" "$2"*60""+"$3}'|sed 's#\.# #g'|awk '{print "echo $(("$2"-TTT))"}'|sed "s#TTT#$2#g"|bash)
echo "ffmpeg -i $1 -af 'afade=t=in:ss=0:d=$2,afade=t=out:st=$dur:d=$2' output.mp3"|bash
