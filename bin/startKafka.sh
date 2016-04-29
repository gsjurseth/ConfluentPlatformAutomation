#!/bin/bash

MYDIR=$(dirname $0)
source $MYDIR/apigee-kafka-lib.sh

cd $APIGEE_KAFKA_HOME/var/logs/kafka
$CONFLUENT_HOME/bin/kafka-server-start -daemon $CONFLUENT_HOME/etc/kafka/server.properties
