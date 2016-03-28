KEY=/home/ubuntu/.ssh/apirut-key-pair-2.pem
KAFKA=/home/ubuntu/kafka/kafka_2.11-0.9.0.1
HOST_LIST="KAFKA1 KAFKA2 KAFKA3"

for host in $HOST_LIST
do
	# execute remote ssh command on each host on the list
	echo
	echo ">> STARTING kafka on $host ..."	

	command="ssh -i $KEY $host '$KAFKA/bin/kafka-server-stop.sh"

	echo ">> executine [$command] ..."	
	eval "$command"

	echo ">> list of java processes on $host ..."
	ssh -i $KEY $host 'jps'

done



