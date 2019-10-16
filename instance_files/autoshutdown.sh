#!/bin/sh
SERVICE='paper.jar' # paper or server?
if [[ ! -v EMPTY_SERVER_TIMEOUT_FLAG ]]; then # if flag is unset
    export EMPTY_SERVER_TIMEOUT_FLAG=FALSE
if ps ax | grep -v grep | grep $SERVICE > /dev/null; then
    	PLAYERSEMPTY=" There are 0 of a max 20 players online"
	$(screen -S minecraft -p 0 -X stuff "list^M")
	sleep 5
	$(screen -S minecraft -p 0 -X stuff "list^M")
	sleep 5
	PLAYERSLIST=$(tail -n 1 /home/ubuntu/logs/latest.log | cut -f2 -d"/" | cut -f2 -d":")
	echo $PLAYERSLIST
	if [ "$PLAYERSLIST" = "$PLAYERSEMPTY" ]
	then
		if [ "$EMPTY_SERVER_TIMEOUT_FLAG" = "TRUE" ]
		then
			echo "Empty server, shutting down"
			proper_shutdown
		else
			echo "Empty server, waiting 5m"
			export EMPTY_SERVER_TIMEOUT_FLAG=TRUE
		fi
	else
		echo "People showed up"
		export EMPTY_SERVER_TIMEOUT_FLAG=FALSE
	fi
else
	if [ "$EMPTY_SERVER_TIMEOUT_FLAG" = "TRUE" ]
		then
			echo "Screen does not exist, shutting down"
			proper_shutdown
		else
			echo "Screen does not exist, waiting 5m"
			export EMPTY_SERVER_TIMEOUT_FLAG=TRUE
		fi
	else
		echo "Screen showed up"
		export EMPTY_SERVER_TIMEOUT_FLAG=FALSE
	fi
fi

proper_shutdown() {
	# git stuff here
	$(sudo /sbin/shutdown -P +1)
}
