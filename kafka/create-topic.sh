KAFKA=$HOME/kafka/kafka_2.11-0.9.0.1/
$KAFKA/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

