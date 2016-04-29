IP1=10.0.0.8
IP2=10.0.0.9
IP3=10.0.0.10

APIGEE_KAFKA_HOME=/opt/apigee_kafka
CONFLUENT_HOME=$APIGEE_KAFKA_HOME/confluent
MYIP=$(hostname -i)
HOSTNAME=$(hostname)


case $MYIP in
	$IP1)
		KAFKA_BROKER_ID=1
		KAFKA_REST_ID='kafka-rest-1'
	;;
	$IP2)
		KAFKA_BROKER_ID=2
		KAFKA_REST_ID='kafka-rest-2'
	;;
	$IP3)
		KAFKA_BROKER_ID=3
		KAFKA_REST_ID='kafka-rest-3'
	;;
esac

#confluent-2.0.1/etc/kafka/server.properties
## kafka broker id
#broker.id=$KAFKA_BROKER_ID
KAFKA_BROKER_ID=$KAFKA_BROKER_ID
## kafka broker port
#port=9092
KAFKA_BROKER_PORT=9092
## kafka host name
#host.name=$HOSTNAME
KAFKA_HOSTNAME=$HOSTNAME
## kafka log home
#log.dirs=$KAFKA_LOG_HOME
KAFKA_LOG_HOME=$APIGEE_KAFKA_HOME/var/kafka/logs
##kafka partitions
#num.partitions=$KAFKA_PARTITIONS
KAFKA_PARTITIONS=10
## zookeeper setup for kakfa
#zookeeper.connect=$IP1:2181,$IP2:2181,$IP3:2181
ZOOKEEPER_HOSTS=$IP1:2181,$IP2:2181,$IP3:2181
## turn on ability to delete topics
#delete.topic.enable=true
KAFKA_DELETE_TOPIC_ENABLED=true
#confluent-2.0.1/etc/kafka/zookeeper.properties
## ZK data home
#dataDir=$ZOOKEEPER_DATA_HOME
ZK_DATA_HOME=$APIGEE_KAFKA_HOME/var/lib/zookeeper
## Need to iterate over number of zookeepers ##
## But this is not implemented at this time ##
####
###server.1=$IP1:2888:3888
###server.2=$IP2:2888:3888
###server.3=$IP3:2888:3888
## limits
###initLimit=5
###syncLimit=2
##confluent-2.0.1/etc/kafka-rest/kafka-rest.properties
#id=kafka-rest-test-server3
KAFKA_REST_ID=$KAFKA_REST_ID
##zookeeper.connect=$ZOOKEEPER_HOSTS
