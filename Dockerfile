FROM openjdk:11

WORKDIR /swagger-petstore

COPY target/lib/jetty-runner.jar /swagger-petstore/jetty-runner.jar
COPY target/*.war /swagger-petstore/server.war

RUN groupadd -r petstore && useradd -r -g petstore petstore && \
    chown -R petstore:petstore /swagger-petstore && \
    mkdir -p /var/log && chown petstore:petstore /var/log

USER petstore

EXPOSE 8080

CMD ["java", "-jar",  "/swagger-petstore/jetty-runner.jar", "--log", "/var/log/yyyy_mm_dd-requests.log", "/swagger-petstore/server.war"]
