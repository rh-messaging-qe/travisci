#!/usr/bin/env bash

# build everything that should be analyzed

cd activemq-artemis

pushd artemis-native/
./compile-native.sh
popd

# https://scan.coverity.com/download?tab=java
# see ARTEMIS-861, Coverity Scan has similar limitations as IBM JDK, by coincidence
mvn -Pexamples,ibm-jdk8 -DskipTests=true -Dmaven.javadoc.skip=true -pl \!:joram-tests,\!:soak-tests,\!:stress-tests,\!:timing-tests,\!:performance-tests,\!:integration-tests,\!:jms-tests,\!:smoke-tests compile
