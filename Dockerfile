FROM openjdk:17-jdk-slim
ARG JAR_VERSION
RUN useradd -m appuser
USER appuser
WORKDIR /app
COPY build/libs/*.jar ./
ENTRYPOINT ["java", "-jar"]
CMD ["sh", "-c", "gradle-hello-world-${JAR_VERSION}-all.jar"]
