# configure prompt                                                                  
PS1='${debian_chroot:+($debian_chroot)}\u@STORM 2:\w\$ '                                 


# install nmon
sudo apt-get install nmon

sudo apt-get install open-jdk...
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
tickTime=2000
dataDir=/tmp/zookeeper
clientPort=2181

# start zookeeper
$ZK_HOME/bin/zkServer.sh start

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

# add KAFKA_HOME to .profile
KAFKA_HOME="$HOME/kafka/kafka_2.11-0.9.0.1"
export KAFKA_HOME



