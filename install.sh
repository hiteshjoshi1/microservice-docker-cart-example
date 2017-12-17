#!/bin/bash
#sudo docker rm eureka
#sudo docker rm config
#sudo docker rm customer1
echo 'Creating Volume Mount for Docker...'
mkdir -p /home/hitesh/jarloc
cd  servicediscovery
echo 'Build discovery...'
mvn clean package -DskipTests

cd ../config
echo 'Build config...'
mvn clean package -DskipTests

cd  ../customer

echo 'Build customer...'
mvn clean package -DskipTests


cd  ../inventory
echo 'Build inventory...'
mvn clean package -DskipTests

cd  ../invoice
echo 'Build invoice...'
mvn clean package -DskipTests


cd  ../monitor
echo 'Build monitor...'
mvn clean package -DskipTests


cd ../
echo 'Copying .....'
cp servicediscovery/target/servicediscovery-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp config/target/config-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp customer/target/customer-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp inventory/target/inventory-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp invoice/target/invoice-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp monitor/target/monitor-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
echo 'All engines up, ready to launch to hyperspace .....'
sudo docker-compose up
