KEY=/home/ubuntu/.ssh/apirut-key-pair-2.pem
HOST_LIST="STORM1 STORM2 STORM3"

i=1

for host in $HOST_LIST
do
	# execute remote ssh command on each host on the list
	echo
	echo ">> STARTING  on $host ..."	

	if [ "$i" -eq 1 ]; then
		command="ssh -i $KEY $host '/home/ubuntu/storm/apache-storm-0.10.0/bin/storm nimbus' &"
	else
		command="ssh -i $KEY $host '/home/ubuntu/storm/apache-storm-0.10.0/bin/storm supervisor' &"
	fi

	echo ">> executine [$command] ..."	
	eval "$command"

	echo ">> list of java processes on $host ..."
	ssh -i $KEY $host 'jps'

	let i=i+1
done



