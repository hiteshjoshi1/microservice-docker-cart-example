#!/bin/bash
echo 'Creating Volume Mount for Docker...'
mkdir -p ${HOME}/jarloc

#echo 'getting config from git...'
#if [[ ! -d "${HOME}/jarloc/microservice-docker-cart-config" ]]; then
#git clone git@github.com:hiteshjoshi1/microservice-docker-cart-config.git ${HOME}/jarloc/#microservice-docker-cart-config
#fi

echo 'Building the entire project ...'
mvn clean package -DskipTests


echo 'Copying .....'
cp servicediscovery/target/servicediscovery-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp config/target/config-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp customer/target/customer-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp inventory/target/inventory-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp invoice/target/invoice-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp monitor/target/monitor-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp zuulEdgeGateway/target/zuulEdgeGateway-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
cp zipkinTimer/target/zipkinTimer-0.0.1-SNAPSHOT.jar ${HOME}/jarloc
echo 'All engines up, ready to launch to hyperspace .....'
docker-compose up
