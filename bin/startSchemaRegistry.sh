#!/bin/bash

MYDIR=$(dirname $0)
source $MYDIR/apigee-kafka-lib.sh


cd $APIGEE_KAFKA_HOME/var/logs/schema-registry
$CONFLUENT_HOME/bin/schema-registry-start -daemon $CONFLUENT_HOME/etc/schema-registry/schema-registry.properties
