# gradle-hello-world with simple CI/CD pipeline

## Java Hello World using the Gradle Wrapper and the Kotlin DSL
This is a Hello World project that contains the most important parts of the Gradle build scripts.
Pipeline with GitHub Actions features automatic versioning and Docker.

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

# CI/CD Pipeline
- **Automatic versioning**: Increment the patch version of the JAR file with each workflow run.
- **Gradle Wrapper build**: Compile Java code and package it into JAR files.
- **Docker**: Build Docker image containing the artifact (Auto tagged version) and publish it to Docker Hub.
- **Update repo**: Automatically push changes to the repository.
- **Multistage Docker**: Build and compile steps are implemented in a multistage Dockerfile.

## Triggering the pipeline
1. **Clone the repository**:
   ```
   git clone https://github.com/niv-devops/gradle-hello-world.git
   cd gradle-hello-world
   ```

2. **Make changes and push to repository**:

   Change the name in HelloWorld.java print message and push changes to master to auto-trigger the pipeline
   ```
   git add .
   git commit -m "commit_message"
   git push origin master
   ```
   PR and merge will also auto-trigger the pipeline
   ```
   git switch -c brnach-name
   git add .
   git commit -m "commit_message"
   git push origin brnach-name
   # After pushing to your branch, open PR and merge to master. Pipeline will be triggered.
   ```

## Automatic versioning
A simple script will run to fetch the current app version, defined in build.gradle.kts file.
The script will modify the file to increase the patch version of the app (E.g 1.0.1 --> 1.0.2).
The new version will be saved as key-value into $GITHUB_OUTPUT to be used later in the pipeline.

## Multistage Dockerfile
Dockerfile defines how to build the app's image. The first stage will copy all files from repo into container environment.
Then it will build and package Java code into JAR artifact, using Gradle Wrapper (intruction of build defined in gradlew file).
Second stage will copy only the created *-all.JAR file from first stage, and will run it as a non-root user.

## Publishing image and Running container
Pipeline is taking care of login and pushing image into DockerHub, using Docker's verified action.
Next step pulls the image from DockerHub and runs it on the runner. A simple "Hello world" with your name will be printed to stdout.

## Push changes back to repo
Script executes git commands to push changes done during pipeline (Updating patch version), back to repo.
skip ci used in commit msg so the pipeline will not be triggered again.
