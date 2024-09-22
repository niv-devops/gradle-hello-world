# gradle-hello-world with simple CI/CD pipeline

## Java Hello World using the Gradle Wrapper and the Kotlin DSL
This is a Hello World project that contains the most important parts of the Gradle build scripts.
Pipeline with GitHub Actions features automatic versioning and Docker.

## Features
- **Automatic versioning**: Increment the patch version of the JAR file with each workflow run.
- **Gradle Wrapper build**: Compile Java code and package it into JAR files.
- **Docker**: Build Docker image containing the artifact (Auto tagged version) and publish it to Docker Hub.
- **Update repo**: Automatically push changes to the repository.
- **Multistage Docker**: Build and compile steps are implemented in a multistage Dockerfile.

## Tasks
```
build - Compiles Hello World and creates JAR files.
2 jar files will be created:
- gradle-hello-world-all.jar - this jar contains everything.
- gradle-hello-world.jar - this is regular jar, it contains only the project's classes.
```

## Build
```
./gradlew build
The jar files located at gradle-hello-world/build/libs/
make the runnable jar executable, then use "java -jar gradle-hello-world-all.jar"
```

## Using this project
1. **Clone the repository**:
   ```
   git clone https://github.com/niv-devops/gradle-hello-world.git
   cd gradle-hello-world
   ```

2. **Choose desired workflow**:
   Choose among two workflows to match corresponding Dockerfile
   Change file name of desired dockerfile to "Dockerfile"
   ```
   cd .gihub/workflows
   ```   

3. **Make changes and push to repository**:
   Choose among two workflows ().gihub/workflows to match corresponding Dockerfile
   ```
   git add .
   git commit -m "commit_message"
   git push origin master
   ```   

## Optional
Following commands were used in pipeline and can be executed directly:
- **Build application**: ./gradlew build
- **Compile and create jar object file**: ./gradlew shadowJar
- **Run the application**: java -jar build/libs/gradle-hello-world-all.jar
- **Build the Docker image**: docker build -t username/project:automated_version .
- **Run the Docker container**: docker run --rm username/project:automated_version
