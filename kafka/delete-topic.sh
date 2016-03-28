if [ -z "$1" ]; then
        echo "usage: $0 [topic name]"
        exit 1
fi

KAFKA=$HOME/kafka/kafka_2.11-0.9.0.1/
$KAFKA/bin/kafka-topics.sh --delete --zookeeper storm1:2181 --topic $1

