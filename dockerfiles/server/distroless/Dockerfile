FROM openjdk:17-alpine AS jre-build
WORKDIR /app


COPY target/app-0.0.1.jar app.jar

RUN jdeps --ignore-missing-deps --module-path modules --add-modules=ALL-MODULE-PATH --generate-module-info out /app/app.jar
RUN jlink --add-modules ALL-MODULE-PATH --no-man-pages --no-header-files --compress=2 --output jre

# take a smaller runtime image for the final output
FROM gcr.io/distroless/static as revive-server-dropwizard
WORKDIR /deployment

# copy the custom JRE produced from jlink
COPY --from=jre-build /app/jre jre

# copy the app
COPY --from=jre-build /app/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["jre/bin/java", "-jar", "app.jar"]
