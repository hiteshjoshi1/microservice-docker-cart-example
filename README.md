Project for a Dockerized Microservics

I am going to use Spring Netflix OSS to build microservices API for a very basic Shopping cart application

1. Docker
2. Spring Boot with MySql - both deployed as docker containers
3. Spring Netflix Eureka Server
4. Spring Eureka Client
5. Spring Feign Client
6. Spring Hysterix circuit breaker
7. Spring Hysterix Dashboard
8. Spring ZuulProxy
9. Stretch Goal - Async API aggregator written in RxJava



Commands ->

To build and package a jar to target folder :<BR>
<b><code>mvn clean package</code></b>


To start the Mysql container: <BR>
<b><code>docker run --name docker-mysql -e MYSQL_ROOT_PASSWORD=test -P -d mysql</code></b>


To Build the image from Docker File - Custom image as specified in the Dockerfile ---> (Note the .) <br>

1. Build(Or Rebuilding) Service Discovery Customer, Inventory , Invoice from the docker file .

<b><code>docker build -t microservice/customer . </code></b>
<b><code>docker build -t microservice/inventory . </code></b>
<b><code>docker build -t microservice/invoice . </code></b>

Building a container happens once, once it is built you can run it from the same folder and give it a name.

To Run the  Custom Image, notice the linkage to the mysql container for microservices--><br>
<b><code>docker run --name docker-discovery  -P -d microservice/serviceDiscovery</code></b>
<b><code>docker run --name docker-customer --link docker-mysql:mysql -P -d microservice/customer</code></b>
<b><code>docker run --name docker-inventory --link docker-mysql:mysql -P -d microservice/inventory</code></b>
<b><code>docker run --name docker-invoice --link docker-mysql:mysql -P -d microservice/invoice</code></b>



In this example, all my microservices connect to the same DB, but this can be easily changed above.


Creating a network
docker network create microservicesnet

Creating a base image
docker build -t microservice/baseserviceimg .


