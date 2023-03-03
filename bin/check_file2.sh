#!/bin/bash

# 	# crontab -e
# 	Min Hour Day Mon Week CMD
#  	0   8    *   *   *   /root/shell/check_file.sh
#
# 	# cat /root/shell/test/check_file_list.txt
# 	/etc/passwd
# 	/etc/group
# 	/etc/hosts
# 	.....

F_LIST=/root/bin/file_list.txt
T_FILE=/tmp/tmp1 
F_RESULT=/root/bin/result.$(date +'%m%d')
EMAIL=root 
BACKUPDIR=/backup

> $F_RESULT

for F_NAME in $(cat $F_LIST)
do
    DIRNAME=$(dirname $F_NAME)
    FILENAME=$(basename $F_NAME)
    BACKUPFILE=$BACKUPDIR/$FILENAME.orig
    if [ -f "$BACKUPFILE" ] ; then
        diff $F_NAME $BACKUPFILE > $T_FILE
        if [ -s $T_FILE ] ; then
            echo "[ WARN ] $F_NAME" >> $F_RESULT
            /bin/cp $F_NAME $BACKUPFILE.$(date +%m%d_%H%M%S)
            /bin/cp $F_NAME $BACKUPFILE
        else
            echo "[  OK  ] $F_NAME" >> $F_RESULT
        fi
    else
        /bin/cp $F_NAME $BACKUPFILE
    fi
done

grep -qw WARN $F_RESULT
if [ $? -eq 0 ] ; then
    mailx -s "[ WARN ] Check Files" $EMAIL < $F_RESULT
else
    mailx -s "[  OK  ] Have a good time." $EMAIL < $F_RESULT
fi

rm -f $T_FILE
