#! /usr/bin/env bash

if [ "$1"x != "x" ]
then
	case $1 in
		master)
			echo "======================" >> /var/log/messages 
			echo "`date '+%F %H:%M:%S'`  Auto switch master  " >> /var/log/messages
			echo "======================" >> /var/log/messages 
		;;
		backup)
			echo "======================" >> /var/log/messages
			echo "`date '+%F %H:%M:%S'`  Auto switch backup  " >> /var/log/messages
			echo "======================" >> /var/log/messages
		;;
		fault)
			echo "======================" >> /var/log/messages
			echo "`date '+%F %H:%M:%S'`  Notify fault  " >> /var/log/messages
			echo "======================" >> /var/log/messages
		;;
		*)
			#echo "default"
		;;
	esac
else
	exit 0
fi
