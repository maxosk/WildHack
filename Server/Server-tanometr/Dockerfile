#FROM ubuntu:trusty
#RUN apt-get update && apt-get install -y tini
#RUN apt-get install nano

FROM openjdk:15-jdk-alpine
RUN apk update
RUN apk add sudo
RUN apk add nano

#RUN apk add --update openssl
#RUN apk update
#RUN apk add install vim
EXPOSE 8080
ADD target/spring-boot-docker1.jar spring-boot-docker1.jar
ENTRYPOINT ["java","-jar","/spring-boot-docker1.jar"] CMD ["-start"]

