# Stage 1: Build the application
FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY . .
RUN ./gradlew build shadowJar

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
RUN useradd -m appuser
COPY --from=build . .
RUN ls ./app
USER appuser
CMD ["java", "-jar", "gradle-hello-world-all.jar"]
