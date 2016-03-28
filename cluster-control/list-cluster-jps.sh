KEY=/home/ubuntu/.ssh/apirut-key-pair-2.pem
HOST_LIST="STORM1 STORM2 STORM3 KAFKA1 KAFKA2 KAFKA3"

for host in $HOST_LIST
do
	# execute remote ssh command on each host on the list
	echo
	echo ">> LIST OF JAVA PROCESSES on [ $host ]:"	

	ssh -i $KEY $host 'jps'

done



