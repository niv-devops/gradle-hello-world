# Stage 1: Build the application
FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY . .
RUN gradle shadowJar

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
RUN useradd -m appuser
USER appuser
COPY --from=build /app/build/libs/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
