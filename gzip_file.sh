#!/bin/bash
LOGDIR=/tmp
cd $LOGDIR

find -maxdepth 1 -type f -mtime +3 -name 'NotificationItem-201*.log' | sed 's/.*\///' | while read logfile

do
if [[ $logfile != *"gz" ]]; then
echo $logfile
gzip -f -9 $logfile
fi
done

find $LOGDIR -name '*.gz' -type f -mtime +90 | xargs rm -f

