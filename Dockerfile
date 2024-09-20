FROM openjdk:17-jdk-slim
RUN useradd -m appuser
USER appuser
WORKDIR /app
COPY /build/libs/gradle-hello-world-all.jar gradle-hello-world-all.jar
# ENTRYPOINT ["java", "-jar", "/app.jar"]
CMD ["java", "-jar", "gradle-hello-world-all.jar"]
