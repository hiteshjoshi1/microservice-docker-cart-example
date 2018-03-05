#!/bin/bash
echo 'Creating Volume Mount for Docker...'
mkdir -p /home/${USER}/jarloc

echo 'Building the entire project ...'
mvn clean package -DskipTests

# cd  servicediscovery
# echo 'Build discovery...'
# mvn clean package -DskipTests

# cd ../config
# echo 'Build config...'
# mvn clean package -DskipTests

# cd  ../customer

# echo 'Build customer...'
# mvn clean package -DskipTests


# cd  ../inventory
# echo 'Build inventory...'
# mvn clean package -DskipTests

# cd  ../invoice
# echo 'Build invoice...'
# mvn clean package -DskipTests


# cd  ../monitor
# echo 'Build monitor...'
# mvn clean package -DskipTests

# cd  ../zuulEdgeGateway
# echo 'Build edge gateway...'
# mvn clean package -DskipTests

# cd  ../zipkinTimer
# echo 'Build zipkin ui...'
# mvn clean package -DskipTests
# cd ../

echo 'Copying .....'
cp servicediscovery/target/servicediscovery-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp config/target/config-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp customer/target/customer-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp inventory/target/inventory-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp invoice/target/invoice-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp monitor/target/monitor-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp zuulEdgeGateway/target/zuulEdgeGateway-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
cp zipkinTimer/target/zipkinTimer-0.0.1-SNAPSHOT.jar /home/${USER}/jarloc
echo 'All engines up, ready to launch to hyperspace .....'
sudo docker-compose up
