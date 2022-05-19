#
# Set a variable that can be used in all stages.
#
ARG BUILD_HOME=/docker-example

#
# Gradle image for the build stage.
#
FROM gradle:jdk17 as build-image

#
# Set the working directory.
#
ARG BUILD_HOME
ENV APP_HOME=$BUILD_HOME
WORKDIR $APP_HOME

#
# Copy the Gradle config, source code, and static analysis config
# into the build container.
#
COPY build.gradle settings.gradle $APP_HOME/
COPY src $APP_HOME/src
COPY config $APP_HOME/config

#
# Build the application.
#
RUN gradle --no-daemon test
RUN gradle --no-daemon build

#
# Java image for the application to run in.
#
FROM openjdk:17

#
# Copy the jar file in and name it app.jar.
#
ARG BUILD_HOME
ENV APP_HOME=$BUILD_HOME
COPY --from=build-image $APP_HOME/build/libs/*.jar app.jar

# To launch main class in module:
ENTRYPOINT ["java", "-jar", "app.jar"]
