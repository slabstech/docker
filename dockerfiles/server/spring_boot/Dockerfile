FROM slabstech/gradle AS jre-build
WORKDIR /app

## Change the path to copy the source code
## 'servers/dropwizard' should be replace with the path of SpringBoot Project Base Directory

COPY servers/spring_boot/ server

RUN gradle -p /app/server/ build -x test

RUN cp /app/server/build/libs/app-0.0.1.jar /app/server/build/app.jar

RUN jdeps --ignore-missing-deps --module-path modules --add-modules=ALL-MODULE-PATH --generate-module-info out /app/server/build/app.jar
RUN jlink --add-modules ALL-MODULE-PATH --no-man-pages --no-header-files --compress=2 --output jre

# take a smaller runtime image for the final output
FROM slabstech/alpine as server-spring-boot
WORKDIR /deployment

# copy the custom JRE produced from jlink
COPY --from=jre-build /app/jre jre

# copy the app dependencies
COPY --from=jre-build /app/server/build/lib/* lib/

# copy the app
COPY --from=jre-build /app/server/build/app.jar app.jar

# run the app on startup
EXPOSE 8080

ENTRYPOINT ["jre/bin/java", "-jar", "app.jar"]
