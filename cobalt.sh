#!/bin/bash
wgethelper="";url="$1"
generateJSON(){
	cat<<EOF 
	{"url": "$url", "vQuality": "best"}
EOF
}
getLink(){ 
    wgethelper=$(curl -H "Accept: application/json" -H "Content-Type:application/json" -H "User-Agent: Mozilla/5.0" -X POST --data "$(generateJSON)" "https://co.wuk.sh/api/json"| tac | tac | jq -r '.url') 
}
if [ $# -eq 0 ];then echo "Usage: cobalt <video url>";exit 1;fi
getLink 
wget -c -O "Video$RANDOM.mp4" -P "$HOME/Downloads/" $wgethelper
