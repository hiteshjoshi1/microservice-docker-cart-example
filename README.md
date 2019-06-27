# Microservics Architecture

###  written by Hitesh Joshi - sendmailtojoshi@gmail.com


This is proof of concept application where I am trying to build a very basic Shopping cart using microservices, the main intent is to setup microservices properly.

Due to work and life, this project has taken a back seat. If you want to contribute, feel free to shoot me a PR.

- Your base computer should have mvn installed. So check mvn -v
- You should have docker installed and logged into docker registry to pull images. So do, docker login

What is done so far -

1. Broken the monolith into smaller microservices.
2. Externalized config to a seprate git repository.
3. Enabled Service Discovery using Netflix Eureka
4. Enabled Circuit breaking in between services using Netflix Hysterix
5. Enabled Circuit monitoring using Hystrix and Turbine dashboards
6. Enabled distributed performance monitoring using Spring Sleuth and Zipkin
7. Enabled Edge server using Netflix Zuul
8. Enabled feign clients.
9. Enabled API documentation for individual microservices and through the Edge proxy
10. Used MySql as the database
11. All components can be deployed as docker containers with the attached docker compose file which pre populates the db on startup.
12. Angular SPA deployed on Edge gateway 
	- http://localhost:1101/

13. Make sure that you look at the other github repo which has all the externalized config for this project.
14. Swagger Documentation on edge server.

What I intend to do - 
Must DO - Deploy using kubernetes and helm

Look at Load Balancing with Multiple regions , zones - https://cloud.spring.io/spring-cloud-netflix/multi/multi_spring-cloud-eureka-server.html#spring-cloud-eureka-server-zones-and-regions
1. Securing the Microservices with OAuth 2 / Spring security.
2. Distributed Log analysis with Elastic Search, logstash and Kibana
3. Distributed Caching with Memacache/Hazelcast.
4. CI/CD pipeline
5. Find a cheap hosting platform and deploy this on cloud :)





### Notes -
- If you are building it without docker, configuration is picked up from github -
  cloud:
    config:
      server:
        git:
          uri: git@github.com:hiteshjoshi1/microservice-docker-cart-config.git
          
- If you are building it in docker, this configuration is downloaded and then used. For some reason i was not able to connect config project with  github from docker even after setting up ssh.    
      
- In order to run these locally without docker, you need to have a Rabbit MQ and Sql Server started and running as a service. With docker , docker will bring them up. RabbitMQ is needed for zipkin  server so that logs are sent by your application to Zipkin. You can replace this RabbitMQ with Kafka.

- I have written <b>install.sh</b> which does the job of CI of building and packaging the Spring boot application and put them in a directory from where they can be mounted to docker volumes.
- <b>install.sh</b> will also take care of bringing all containers using docker-compose. 

All you need is docker , docker-compose, java and maven in the host machine.

 Under the hood this is what happens -
1. Builds all microservices, eureka server, config
2. Brings up mysql
3. Populate mysql with DDL and DML if not done already
4. Bring up config server
5. Bring up Eureka Server
6. Bring up microservices - Eureka clients. 
7. Brings up the Zuul Edge gateway.
8. Angular SPA - cart UI is bundled with Edge gateway and deployed
9. Add all of the above components into one network so that they can communicate

### Endpoints :-

Direct web service endpoints
- Eureka - http://localhost:1111/eureka
- Customer - localhost:2222/customer 
- Inventory - http://localhost:3333/inventory
- Invoice - http://localhost:4444/invoice
- Config - http://localhost:5555/customer-service/dev
- Hystrix Monitor - http://localhost:7777/hystrix
- Endpoint with a Circuit breaker and Hystrix fallback - http://localhost:2222/customers/1/orders



### URL's through edge proxy :-
- http://localhost:1101/customer-service/customers
- http://localhost:1101/invoice-service/invoice 
- http://localhost:1101/inventory-service/inventory

and so on...

Zuul Routes  - You can add Filters on the Zuul Proxy layer. This examples we have not added any.

Monitor project-
### Hystrix Monitor details :-
Hystrix Monitor - We need to provide the application that needs to be montored. 
Please input in Hystrix Dashboard - 
- http://localhost:2222/hystrix.stream

If you are in docker, input - 
- http://172.20.0.7:2222/hystrix.stream 

And so on for other microservices...

### Turbine Dashboard :-

For turbine based monitoring
http://172.20.0.7:7777/turbine.stream?cluster=CUSTOMER-SERVICE

### Zipkin Project 
http://localhost:3301/zipkin/


### Swagger URL from Zuul Edge gatway :-

http://localhost:1101/swagger-ui.html#/

### Individual Swagger URL of microservices :- 
- http://localhost:3333/swagger-ui.html#/
- http://localhost:4444/swagger-ui.html#/
- http://localhost:5555/swagger-ui.html#/

### Micro Service URL
GET - http://localhost:2222/customers
POST - http://localhost:2222/customers/new/
GET - http://localhost:2222/customers/{custID}/orders
POST (Create an Order for a customer) - http://localhost:2222/customers/order 



| Micro service URL | Service URL through edge proxy |
| --- | --- |
| http://localhost:2222/customers | http://localhost:1101/customer-service/customers |
| http://localhost:2222/customers/{custID}/order | http://localhost:1101/customer-service/customers/{custID}/order |
|http://loclahost:4444/invoice|http://localhost:1101/invoice-service/invoice |



### Checking Cloud config :-
Checking the cloud config coming from the config server deployed on the port 5555.

- http://localhost:5555/customer-service/dev
- http://localhost:5555/discovery-service/dev
- http://localhost:5555/invoice-service/dev
- http://localhost:5555/inventory-service/dev
- http://localhost:5555/zuulgateway/dev

The project uses the config defined here
```
https://github.com/hiteshjoshi1/microservice-docker-cart-config

```




### NOTE 
If you want to use the same config, clone this repo and then change the gut URL to your cloned repo in the config/ resources For the config server to be able to fetch property from github , setup SSH access to your github account.

To see corresponding docker profiles, change the profile at the end as - 
- http://localhost:5555/inventory-service/docker


## References and Citations :- 
- https://alexandreesl.com/2016/01/08/docker-using-containers-to-implement-a-microservices-architecture/ 
- https://www.3pillarglobal.com/insights/building-a-microservice-architecture-with-spring-boot-and-docker-part-iii 
- https://github.com/kbastani/spring-cloud-microservice-example
- https://github.com/sqshq/PiggyMetrics
- https://www.digitalocean.com/community/tutorials/an-introduction-to-oauth-2

-------------------------------------------------------------------------------------------------------------

This old doc is here for doc purpose only

Old ->
To start the Mysql container: <BR>
<b><code>docker run --name docker-mysql -e MYSQL_ROOT_PASSWORD=test -P -d mysql</code></b>

To populate the data , go to sql command prompt with 
sudo  docker run -it --link docker-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

Run init.sql


Then Create a network , this should also be ideally part of docker compose

<div>
<b><code>sudo docker network create microservicesnet</b></code>
</div>
Connect mysql to it -

<div><b><code>sudo docker network connect microservicesnet docker-mysql</b></code></div>


Commands ->

As of now I go to each inside each microservice and generate its jar
example,
cd customers
To build and package a jar to target folder :<BR>
<b><code>mvn clean package</code></b>


Copy all microservices jar to the place which is shared with the volume - Ideally this should be done througha CI JOb (TODO) <br>
<code>cp customer-0.0.1-SNAPSHOT.jar.original /home/hitesh/jarloc</code>



once you have all your jars in jarloc (Jar location), you can bring all the micro-services as well as the discovery server up with

<div><b><code>sudo docker-compose up -d</code></b></div>


The Java 8 base image used to build the microservice containers is also checked in dockerhub and can be seprately downloaded as
<div><b><code>docker pull hiteshjoshi1/microservice-docker-cart-example</code></b></div

The base image can be built using

<div><b><code>docker build -t microservice/baseserviceimg .</code></b></div>



___________________________________________________________________________________________________________________________

NOT required-

Building individual containers without docker compose


To Build the image from Docker File - Custom image as specified in the Dockerfile ---> (Note the .) <br>

1. Build(Or Rebuilding) Service Discovery Customer, Inventory , Invoice from the docker file .
<div>
<ul>
<li><b><code>docker build -t microservice/customer . </code></b>
<li><b><code>docker build -t microservice/inventory . </code></b>
<li><b><code>docker build -t microservice/invoice . </code></b>
</ul>
</div>
Building a container happens once, once it is built you can run it from the same folder and give it a name.

To Run the  Custom Image, notice the linkage to the mysql container for microservices--><br>
<ul>
<li><b><code>docker run --name docker-discovery  -P -d microservice/serviceDiscovery</code></b>
<li><b><code>docker run --name docker-customer --link docker-mysql:mysql -P -d microservice/customer</code></b>
<li><b><code>docker run --name docker-inventory --link docker-mysql:mysql -P -d microservice/inventory</code></b>
<li><b><code>docker run --name docker-invoice --link docker-mysql:mysql -P -d microservice/invoice</code></b>
</ul>

