#!/usr/bin/env bash
array_hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
	for i in {1..5}
	do
	    for j in ${array_hosts[@]}
	    do
		curl --connect-timeout 10 $j:80 >/dev/null
	        echo $(date) $j result=$? >>result.log
	    done
	done