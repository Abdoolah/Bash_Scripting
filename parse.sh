#!/usr/bin/env bash
# AYM - Sep 2020

echo "Source,Destination,Port,Connectivity"> result.csv # is the STD output for the results
while IFS="_" read -r source destination ports <&3;  # Use a different STD input for the server.list file 
do	
	for port in $ports 
	do 
		# Set up a listening connection on the destination machine on the target port
		ssh -tt remote_user@$destination "source ~/.bash_profile; set -m; nc -l "\"$port\""  & "
		# Attempt connection from the source machine onto the above destination:port
		ssh -tt remote_user@$source "nc -w 1 -zn $destination $port" 
		if [ $? -eq 0 ];
			then echo $source","$destination","$port",OPEN" | tee -a result.csv
			else echo $source","$destination","$port",INACCESSIBLE" | tee -a result.csv
		fi 
	done 
done 3< server.list
