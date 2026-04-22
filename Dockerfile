FROM openjdk:11

RUN groupadd -r petstore && useradd -r -g petstore petstore

WORKDIR /swagger-petstore

COPY target/lib/jetty-runner.jar /swagger-petstore/jetty-runner.jar
COPY target/*.war /swagger-petstore/server.war

RUN chown -R petstore:petstore /swagger-petstore

USER petstore

EXPOSE 8080

CMD ["java", "-jar",  "/swagger-petstore/jetty-runner.jar", "--log", "/var/log/yyyy_mm_dd-requests.log", "/swagger-petstore/server.war"]
