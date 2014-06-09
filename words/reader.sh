#!/bin/bash
# http://www.convertfiles.com/
# dict -d gcide tossing | grep -F "\\" | awk -F"\\" '{print $1}' | sort -nk 1 | head -1  # per ottenere la parola desiderata

set -x

cat ${1} | tr -cs A-Za-z '\n' |
tr A-Z a-z |
sort |
uniq -c |
sort -rn > res.txt

cat res.txt | while read LINE; do

WORD=`echo $LINE | awk -F" " '{print $2}'`

LEN=`expr length $WORD`

if [ "$LEN" -le 3 ];
then 
	continue
fi

echo $LINE >> out.txt

done




#cp res.txt out.txt

#cat res.txt | while read LINE; do

#WORD=`echo $LINE | awk -F" " '{print $2}'`

#LEN=`expr length $WORD`

#[ "$LEN" -le 3 ] && { continue; }

#REAL_WORD=`dict -d gcide $WORD | tr A-Z a-z | tr '\\' '@' | grep -F "@" | awk -F"@" '{print $1}' | tr A-Z a-z | sort -nk 1 | head -1`

#REAL_WORD=`echo ${REAL_WORD//[[:blank:]]/}`

#[ -z $REAL_WORD ] && { continue; }

#echo $WORD "->" $REAL_WORD
#CMD=`echo s/${WORD}/${REAL_WORD}/`
#sed -i $CMD out.txt

#done
# |
#sed ${1}q 
