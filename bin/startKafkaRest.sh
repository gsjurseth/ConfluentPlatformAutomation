#!/bin/bash

MYDIR=$(dirname $0)
source $MYDIR/apigee-kafka-lib.sh

cd $APIGEE_KAFKA_HOME/var/logs/kafka-rest
$CONFLUENT_HOME/bin/kafka-rest-start -daemon $CONFLUENT_HOME/etc/kafka-rest/kafka-rest.properties
