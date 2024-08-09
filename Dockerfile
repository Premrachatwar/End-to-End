FROM openjdk:11-jre
COPY target/shweta.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
