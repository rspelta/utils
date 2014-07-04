#!/bin/bash

#set -x

FILE=${1}
DELAY=${2}
PATH_MP3=`pwd`

[ "${FILE}" == "" ] && { FILE="words.txt"; } 
[ "${DELAY}" == "" ] && { DELAY="1"; } 

cat ${FILE} | while read WORD; do

echo "${PATH_MP3}/${WORD}.mp3" >> out.${FILE}
firefox http://www.howjsay.com/index.php?word=${WORD}&submit=Submit &
sleep 2
avconv -f alsa -ac 1 -ar 44100 -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -t 6 -acodec libmp3lame -aq 2 ${WORD}.mp3
#\killall firefox
#mp3splt -r -f -p th=40,min=0 ${WORD}.mp3
#mv ${WORD}_trimmed.mp3 ${WORD}.mp3

done

