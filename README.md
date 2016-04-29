# ConfluentPlatformAutomation
Some automation to setup a confluent environment including clustering and running the kafka-rest proxy

## Quickstart
Download the confluent platform from their site at confluent.io. This automation (for now)
assumes that it will be installing from the tarball and that it will be a 3-node cluster.

Future updates with support for more options forthcoming.

Do like so:

Edit the silent config file.
Set the IPs at the top of the file for each of the nodes in question. As stated above, the current assumption is around a 3-node environment, but this may change in the future.

Then do this:

```
./installIt.sh /path/to/your/confluent-<version>.tar.gz
```


The resulting installation should allow you to start up the environment. On all three nodes run the start script for:
 1. zookeeper
 1. kafka
 1. schema-registry
 1. kafka-rest

That's it... Now you should have kafka-rest instances running on all three hosts listening on the default port of 8082.
