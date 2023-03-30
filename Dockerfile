FROM anapsix/alpine-java
LABEL maintainer="joaolucasv12@gmail.com"
RUN apk add --update docker openrc
RUN rc-update add docker boot
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]

