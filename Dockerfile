FROM cycloid/github-cli AS downloader
WORKDIR /app
ARG GH_TOKEN
ARG BOT_VERSION

RUN GH_TOKEN=$GH_TOKEN gh release download \
    --pattern "JMusicBot-$BOT_VERSION.jar" \
    --repo jagrosh/MusicBot

RUN mv JMusicBot-$BOT_VERSION.jar JMusicBot.jar

FROM eclipse-temurin:11-jre-focal
COPY --from=downloader /app/JMusicBot.jar /app/JMusicBot.jar
WORKDIR /app
ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]
