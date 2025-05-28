FROM eclipse-temurin:11-jre-focal

WORKDIR /app
# The jar file is not included in the repository, so we need to copy it from the host
# The jar file is downloaded from the GitHub release page by the GitHub Actions workflow
# It is a pre-built jar file, so we don't need to build it ourselves
COPY ./JMusicBot.jar ./JMusicBot.jar

# Define an environment variable with a default value
ENV CONFIG_PATH=/app/config.txt

ENTRYPOINT ["sh", "-c", "java -Dconfig=$CONFIG_PATH -Dnogui=true -jar /app/JMusicBot.jar"]
