#!/bin/bash

MYDIR=$(dirname $0)

$MYDIR/startZK.sh
$MYDIR/startKafka.sh
$MYDIR/startSchemaRegistry.sh
$MYDIR/startKafkaRest.sh
