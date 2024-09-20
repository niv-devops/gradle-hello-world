FROM openjdk:17-jdk-slim
RUN useradd -m appuser
USER appuser
WORKDIR /app
COPY build/libs/*.jar app.jar
# ENTRYPOINT ["java", "-jar", "/app.jar"]
CMD ["java", "-jar", "app.jar"]
