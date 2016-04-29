#!/bin/bash

MYDIR=$(dirname $(realpath $0))
source $MYDIR/silent_config.sh
TARBALLPATH=$(realpath $1)


mkdir -p $APIGEE_KAFKA_HOME

cd $APIGEE_KAFKA_HOME

# $1 should be the path to the confluent tarball
tar xf $TARBALLPATH

CONFLUENT_FOLDER_NAME=$(basename $(ls -d /opt/apigee_kafka/confluent*))

ln -s $APIGEE_KAFKA_HOME/$CONFLUENT_FOLDER_NAME $CONFLUENT_HOME

cp $MYDIR/propertyTemplates/zookeeper.properties $CONFLUENT_HOME/etc/kafka
cp $MYDIR/propertyTemplates/server.properties $CONFLUENT_HOME/etc/kafka
cp $MYDIR/propertyTemplates/kafka-rest.properties $CONFLUENT_HOME/etc/kafka-rest

for file in $CONFLUENT_HOME/etc/kafka/zookeeper.properties $CONFLUENT_HOME/etc/kafka/server.properties $CONFLUENT_HOME/etc/kafka-rest/kafka-rest.properties
do
	sed -i  -e "s#@HOSTNAME@#$HOSTNAME#g" $file
	sed -i  -e "s#@KAFKA_BROKER_ID@#$KAFKA_BROKER_ID#g" $file
	sed -i  -e "s#@KAFKA_BROKER_PORT@#$KAFKA_BROKER_PORT#g" $file
	sed -i  -e "s#@KAFKA_LOG_HOME@#$KAFKA_LOG_HOME#g" $file
	sed -i  -e "s#@KAFKA_PARTITIONS@#$KAFKA_PARTITIONS#g" $file
	sed -i  -e "s#@ZOOKEEPER_HOSTS@#$ZOOKEEPER_HOSTS#g" $file
	sed -i  -e "s#@KAFKA_DELETE_TOPICS_ENABLED@#$KAFKA_DELETE_TOPICS_ENABLED#g" $file
	sed -i  -e "s#@ZK_DATA_HOME@#$ZK_DATA_HOME#g" $file
	sed -i  -e "s#@KAFKA_REST_ID@#$KAFKA_REST_ID#g" $file
	sed -i  -e "s#@KAFKA_DELETE_TOPIC_ENABLED@#$KAFKA_DELETE_TOPIC_ENABLED#g" $file
	sed -i  -e "s#@IP1@#$IP1#g" $file
	sed -i  -e "s#@IP2@#$IP2#g" $file
	sed -i  -e "s#@IP3@#$IP3#g" $file
done

mkdir -p $ZK_DATA_HOME
echo $KAFKA_BROKER_ID > $ZK_DATA_HOME/myid

cp -a $MYDIR/bin $APIGEE_KAFKA_HOME

cp $MYDIR/propertyTemplates/apigee-kafka-lib.sh $APIGEE_KAFKA_HOME/bin

sed -i -e "s#@CONFLUENT_HOME@#$CONFLUENT_HOME#" $APIGEE_KAFKA_HOME/bin/apigee-kafka-lib.sh
sed -i -e "s#@APIGEE_KAFKA_HOME@#$APIGEE_KAFKA_HOME#" $APIGEE_KAFKA_HOME/bin/apigee-kafka-lib.sh


mkdir -p $APIGEE_KAFKA_HOME/var/logs/kafka
mkdir -p $APIGEE_KAFKA_HOME/var/logs/zookeeper
mkdir -p $APIGEE_KAFKA_HOME/var/logs/schema-registry
mkdir -p $APIGEE_KAFKA_HOME/var/logs/kafka-rest
