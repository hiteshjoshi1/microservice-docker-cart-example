FROM java:8
VOLUME /tmp
ADD /target/servicediscovery-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 1111
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]