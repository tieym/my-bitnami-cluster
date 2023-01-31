#! /bin/bash

HEALTHY=true

DISK_SPACE=`df -h / | grep  -i overlay | awk '{print substr($5, 1, 2)}'`

# if disk space use is greater then 90%, the container is no longer considerd healthy
if [ $DISK_SPACE -gt 90 ]
	then
		echo "disk space is low, $DISK_SPACE is in use!"
		HEALTHY=false
		exit 1
fi

psql -lqt | cut -d \| -f 1 | grep -qw <db_name>



if [ $HEALTHY = true ]
then
	echo "container is healthy $HEALTHY"
    exit 0
else
	echo "container is unhealthy! $HEALTHY"
	exit 1
fi





