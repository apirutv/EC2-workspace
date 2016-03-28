if [ -z "$1"  ] || [ -z "$2" ]; then
        echo "usage: $0 [topic name] [retention in ms]"
        exit 1
fi

KAFKA=$HOME/kafka/kafka_2.11-0.9.0.1/
$KAFKA/bin/kafka-topics.sh --alter --zookeeper storm1:2181 --topic $1 --config retention.ms=$2

