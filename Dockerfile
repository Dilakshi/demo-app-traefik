# FROM openjdk:17-jdk-slim AS build

# COPY .mvn .mvn
# COPY mvnw .
# COPY pom.xml .
# RUN ./mvnw dependency:go-offline
# COPY src src
# RUN ./mvnw package -DskipTests

# FROM openjdk:17-jdk-slim
# WORKDIR /demo
# COPY --from=build target/*.jar demo.jar
# ENTRYPOINT ["java", "-jar", "demo.jar"]

FROM openjdk:17-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} demo-app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/demo-app.jar"]