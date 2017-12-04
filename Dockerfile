FROM java:8-jre

MAINTAINER Hitesh Joshi achiever.hitesh@gmail.com

VOLUME [ "/data" ]

WORKDIR /data

EXPOSE 8080
ENTRYPOINT [ "java" ]
CMD ["-?"]