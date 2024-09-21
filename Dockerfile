FROM openjdk:17-jdk-slim
ARG JAR_VERSION
RUN useradd -m appuser
USER appuser
WORKDIR /app
COPY build/libs/*.jar ./
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar gradle-hello-world-${JAR_VERSION}-all.jar"]
