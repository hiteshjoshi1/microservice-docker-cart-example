FROM java:8
VOLUME /tmp
ADD /target/customer-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Dspring.datasource.url=jdbc:mysql://docker-mysql/microservices_cust","-Dspring.datasource.username=root","-Dspring.datasource.password=test","-jar","/app.jar"]