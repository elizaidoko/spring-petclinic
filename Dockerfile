FROM openjdk:17
COPY target/spring-petclinic-3.0.0-SNAPSHOT.jar /temp/spring-petclinic-3.0.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/temp/spring-petclinic-3.0.0-SNAPSHOT.jar","--server.port=8080"]
