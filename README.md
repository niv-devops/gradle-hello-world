# gradle-hello-world CI/CD pipeline

## Java Hello World using the Gradle Wrapper and the Kotlin DSL
This is a Hello World project that contains the most important parts of the Gradle build scripts.
Pipeline with GitHub Actions features automatic versioning and Docker.

## Features
- **Automatic versioning**: Increment the patch version of the JAR file with each workflow run.
- **Gradle Wrapper build**: Compile Java code and package it into JAR files.
- **Docker**: Build Docker image containing the artifact (Auto tagged with the version) and publish it to Docker Hub.
- **Update repo**: Automatically push changes to the repository.

## Tasks
```
build - Compiles Hello World and creates JAR files.
2 jar files will be created:
- gradle-hello-world-all.jar - this jar contains everything.
- gradle-hello-world.jar - this is regular jar, it contains only the project's classes.
```

## Build
1. **Clone the repository**:
   ```
   git clone https://github.com/niv-devops/gradle-hello-world.git
   cd gradle-hello-world
   ```
   
2. **Make changes and push to repository**:
   ```
   git add .
   git commit -m "commit_message"
   git push origin master
   ```   

3. **Build the project and create jar object file**:
   ```
   ./gradlew build
   ./gradlew shadowJar
   ```
   The jar files located at gradle-hello-world/build/libs/
   make the runnable jar executable, then use "java -jar gradle-hello-world-all.jar"

4. **Run the application**:
   Run the application directly with:
   ```
   java -jar build/libs/gradle-hello-world-all.jar
   ```

5. **Build the Docker image**:
   ```
   docker build -t username/project:automated_version .
   ```

6. **Run the Docker container**:
   ```
   docker run --rm username/project:automated_version
   ```
