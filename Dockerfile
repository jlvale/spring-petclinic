FROM anapsix/alpine-java
LABEL maintainer="joaolucasv12@gmail.com"
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar
#Datadog Instrumentation
COPY --from=datadog/serverless-init:1 /datadog-init /app/datadog-init
ADD 'https://dtdg.co/latest-java-tracer' /dd_tracer/java/dd-java-agent.jar
ENV DD_SERVICE=spring-petclinic
ENV DD_ENV=lab
ENV DD_VERSION=1
ENTRYPOINT ["/app/datadog-init"]

# CMD
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]