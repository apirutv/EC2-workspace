KAFKA=$HOME/kafka/kafka_2.11-0.9.0.1/
$KAFKA/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 3 --topic test3

