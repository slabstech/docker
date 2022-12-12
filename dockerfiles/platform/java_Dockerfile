FROM slabstech:base_ms_index_gradle AS jre-build
WORKDIR /app

COPY . .
RUN gradle -p /app/ build -x test

RUN cp /app/build/libs/app-0.0.1.jar /app/app.jar

RUN jdeps --ignore-missing-deps --module-path modules --add-modules=ALL-MODULE-PATH --generate-module-info out /app/app.jar
RUN jlink --add-modules ALL-MODULE-PATH --no-man-pages --no-header-files --compress=2 --output jre

# take a smaller runtime image for the final output
FROM slabstech:base_ms_index_alpine as deployment

RUN apk add dumb-init

WORKDIR /app

RUN addgroup --system javauser && adduser -S -s /bin/false -G javauser javauser

# copy the custom JRE produced from jlink
COPY --from=jre-build /app/jre jre

# copy the app
COPY --from=jre-build /app/app.jar app.jar

RUN chown -R javauser:javauser /app
USER javauser

# run the app on startup

ENTRYPOINT ["dumb-init", "jre/bin/java", "-jar", "app.jar"]
