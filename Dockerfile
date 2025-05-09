FROM eclipse-temurin:11-jre-focal

WORKDIR /app
# The jar file is not included in the repository, so we need to copy it from the host
# The jar file is downloaded from the GitHub release page by the GitHub Actions workflow
# It is a pre-built jar file, so we don't need to build it ourselves
COPY ./JMusicBot.jar ./JMusicBot.jar

ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]
