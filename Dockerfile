# Stage 1: Build the application
FROM gradle:7.4.2-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle shadowJar

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
ARG JAR_VERSION
RUN useradd -m appuser
USER appuser
WORKDIR /app
COPY --from=build build/libs/gradle-hello-world-${JAR_VERSION}-all.jar app.jar
CMD ["java", "-jar", "app.jar"]
