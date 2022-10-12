FROM maven:3.8.6-eclipse-temurin-17-alpine AS jre-build
WORKDIR /app

COPY . .

RUN mvn clean install
COPY target/garuda-0.0.1-SNAPSHOT.jar app.jar

# TODO do this step only if pom.xml is modified. i.e new java modules are added. Add conditional block

RUN jdeps --ignore-missing-deps --module-path modules --add-modules=ALL-MODULE-PATH --generate-module-info out /app/app.jar
RUN jlink --add-modules ALL-MODULE-PATH --no-man-pages --no-header-files --compress=2 --output jre

# take a smaller runtime image for the final output
FROM postgis/postgis:14-3.3-alpine as bhoomi-garuda
WORKDIR /deployment

# copy the custom JRE produced from jlink
COPY --from=jre-build /app/jre jre

# copy the app
COPY --from=jre-build /app/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["jre/bin/java", "-jar", "app.jar"]
