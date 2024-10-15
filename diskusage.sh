#!/bin/bash

echo "Checking the disk space on the machine and send a alert message"

#setting the thershold value

THRESHOLD=2

#Get the disk usage of the particular path that you require 

disk_usage=`df -kh | grep /dev/root | awk '{print $5}' | cut -d '%' -f 1`

if [ "$disk_usage" -ge "$THRESHOLD" ];
then
	echo "Alert: The disk usage on the machine is $disk_usage%  where the it exceeds the threshold value $THRESHOLD%"
else
	echo "Disk usage is $disk_usage which is under the limit"
fi
