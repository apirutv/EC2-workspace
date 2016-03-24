# configure prompt                                                                  
PS1='${debian_chroot:+($debian_chroot)}\u@STORM 2:\w\$ '                                 

# drop cache to release memory
free -m
sync

# switch to root shell
sudo -i
echo 3 > /proc/sys/vm/drop_cache


# install nmon
sudo apt-get install nmon

sudo apt-get install openjdk-7-jdk
sudo apt-get install htop

# getting file from Internet
wget [url]

# ------------------------------------------
# install and config git
# ------------------------------------------
sudo apt-get install git
copy id_rsa to .ssh
git config --global user.name "Apirut Vanchaam"
git config --global user.email "apirut@live.com"
git config --list # show all configs

# git command
git clone git@github.com:apirutv/EC2-workspace
git remote -v # show the origin url
git remote show [origin]
git fetch [remote name]
git commint -m 'message'
git push
git status 
git status -s


# ------------------------------------------
# install and configure MAVEN
# ------------------------------------------
sudo apt-get install maven
# for window, add bin to path
C:\apache-maven-3.3.9-bin\apache-maven-3.3.9\bin
# set JAVA_HOME to point to the JDK
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_73
# test
mvn -v

# ------------------------------------------
# STORM INSTALLATION
# ------------------------------------------

# download zookeeper
wget http://www.eu.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
tar -xzvf zookeeper-3.4.8.tar.gz

# add ZK_HOME to .profile
ZK_HOME="$HOME/zookeeper/zookeeper-3.4.8"
export ZK_HOME

# create zoo.cfg under $ZK_HOME/conf /w the following lines
cp zoo_sample.cfg zoo.cfg
tickTime=2000
dataDir=/home/mladmin/zookeeper/dataDir
clientPort=2181

# create an id file under the dataDir
echo 1 > myid

# cluster config
server.1=0.0.0.0:2888:3888
server.2=zk2:2888:3888
server.3=zk3:2888:3888

# start zookeeper
$ZK_HOME/bin/zkServer.sh start

# if not started, trouble shoot /w foreground mode
$ZK_HOME/bin/zkServer.sh start-foreground

# check status
$ZK_HOME/bin/zkServer.sh status

# download apache storm
wget http://www.apache.org/dyn/closer.lua/storm/apache-storm-0.10.0/apache-storm-0.10.0.tar.gz
tar -xzvf apache-storm-0.10.0.tar.gz
STORM_HOME=/home/ubuntu/storm/apache-storm-0.10.0
HOME=/home/ubuntu

# add the allowing lines to $STORM_HOME/conf/storm.yaml
storm.zookeeper.servers:
     - "127.0.0.1"
storm.zookeeper.port: 2181
nimbus.host: "127.0.0.1"
storm.local.dir: "/tmp/storm-data"
java.library.path: "/usr/local/lib"
storm.messaging.transport: backtype.storm.messaging.netty.Context
supervisor.slots.ports:
     - 6700
     - 6701
     - 6702
     - 6703

# start the master node (nimbus)
$STORM_HOME/bin/storm nimbus

# start supervisor node
$STORM_HOME/bin/storm supervisor

# ------------------------------------------
# KAFKA INSTALLATION
# ------------------------------------------

# download kafka
wget http://www.eu.apache.org/dist/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
(curl -O http://www.eu.apache.org/dist/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz)
tar -xzvf kafka_2.11-0.9.0.1.tgz

# add KAFKA_HOME to .profile
KAFKA_HOME="$HOME/kafka/kafka_2.11-0.9.0.1"
export KAFKA_HOME

# add KAFKA bin to path
PATH="$KAFKA_HOME/bin:$PATH"                                                        

# allow topic to be deleted
# add this line to server.properties
delete.topic.enable=true
~                                                                                   
~                          

# {OPTIONAL} change heap size in $KAFKA_HOME/bin/kafka-server-start.sh
export KAFKA_HEAP_OPTS="-Xmx500M -Xms500M"

# change properties in the Kafka server properties file, server.properties at $KAFKA_HOME/config:
log.dirs=/tmp/kafka-logs
zookeeper.connect=storm1:2181,storm2:2181,storm3:2181

# cluster configuration only
broker.id=[unique id e.g. 1,2,3]
port=9092
host.name=[ip/name of each host e.g. kafka1, kafka2]

# ------------------------------------------
# SPARK INSTALLATION
# ------------------------------------------

wget http://www.scala-lang.org/files/archive/scala-2.11.8.tgz
tar -xzvf scala-2.11.8.tgz 

SCALA_HOME="$HOME/scala/scala-2.11.8/"
export SCALA_HOME
PATH="$SCALA_HOME/bin:$PATH"

wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz
tar -xzvf spark-1.2.0-bin-hadoop2.4.tgz 


SPARK_HOME="$HOME/spark/spark-1.6.1"
export SPARK_HOME
PATH="$SPARK_HOME/bin:$PATH"




