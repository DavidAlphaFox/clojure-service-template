FROM --platform=$BUILDPLATFORM clojure:openjdk-17-lein AS build

WORKDIR /app
COPY project.clj project.clj
RUN lein deps

COPY src src
COPY resources resources
RUN lein uberjar

FROM scratch

COPY --from=build /app/target/uberjar/clojure-service-template-0.1.0-SNAPSHOT-standalone.jar /usr/src/clojure-service-template-0.1.0-SNAPSHOT-standalone.jar
