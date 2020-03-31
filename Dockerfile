FROM alpine:3.11

ARG BUILD_DATE
ARG VCS_REF

RUN echo $BUILD_DATE
RUN echo $VCS_REF

LABEL maintainer="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.title="mysql-client" \
      org.opencontainers.image.description="Minimal image with mysql-client installed." \
      org.opencontainers.url="https://github.com/mintel/docker-mysql-client" \
      org.opencontainers.source="https://github.com/mintel/docker-mysql-client.git" \
      org.opencontainers.image.version="0.1.0" \
      org.opencontainers.image.vendor="Mintel Group Ltd." \
      org.opencontainers.image.licences="MIT" \
      org.opencontainers.authors="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.revision="$VCS_REF"

COPY --from=gcr.io/google_containers/pause-amd64:3.2 /pause /

RUN apk add --no-cache mysql-client

ENTRYPOINT ["mysql"]
