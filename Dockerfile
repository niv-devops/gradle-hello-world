# Stage 1: Build the application
FROM gradle:8.10.1-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle shadowJar

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
ARG JAR_VERSION
RUN useradd -m appuser
USER appuser
COPY --from=build /app/build/libs/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
