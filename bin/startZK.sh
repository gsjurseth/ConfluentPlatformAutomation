#!/bin/bash

MYDIR=$(dirname $0)
source $MYDIR/apigee-kafka-lib.sh

cd $APIGEE_KAFKA_HOME/var/logs/zookeeper
$CONFLUENT_HOME/bin/zookeeper-server-start -daemon $CONFLUENT_HOME/etc/kafka/zookeeper.properties
