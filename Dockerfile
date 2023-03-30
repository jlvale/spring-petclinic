FROM anapsix/alpine-java
LABEL maintainer="joaolucasv12@gmail.com"
RUN apk add --update docker openrc \
    rc-update add docker boot \
    service docker start /
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]

