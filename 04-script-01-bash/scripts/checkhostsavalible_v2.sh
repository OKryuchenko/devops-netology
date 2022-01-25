#!/usr/bin/env bash
array_hosts=(192.168.0.1 173.194.222.113 87.250.250.24)
	error=0
	while (($error == 0))
	do
	    for i in ${array_hosts[@]}
	    do
		curl --connect-timeout 10 $i:80 >/dev/null
		error=$?
		if (($error != 0))
		then
		    echo $i >>error.log
		fi
	    done
	done