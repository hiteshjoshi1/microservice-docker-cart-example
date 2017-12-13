#!/bin/bash
sudo docker rm eureka
sudo docker rm config
sudo docker rm customer1


cd  servicediscovery
echo 'Build discovery'
mvn clean package -DskipTests

cd ../config
echo 'Build config'
mvn clean package -DskipTests

cd  ../customer

echo 'Build customer'
mvn clean package -DskipTests



cd ../
echo 'Copying .....'
cp servicediscovery/target/servicediscovery-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp config/target/config-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc
cp customer/target/customer-0.0.1-SNAPSHOT.jar /home/hitesh/jarloc


sudo docker-compose up
