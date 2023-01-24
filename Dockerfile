FROM alpine:3.12

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.title="k8s-mysqlclient" \
      org.opencontainers.image.description="Minimal image with mysql-client installed." \
      org.opencontainers.url="https://github.com/mintel/k8s-mysqlclient" \
      org.opencontainers.source="https://github.com/mintel/k8s-mysqlclient.git" \
      org.opencontainers.image.version="0.3.0" \
      org.opencontainers.image.vendor="Mintel Group Ltd." \
      org.opencontainers.image.licences="MIT" \
      org.opencontainers.authors="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.revision="$VCS_REF"

COPY --from=gcr.io/google_containers/pause-amd64:3.2 /pause /
COPY --from=banzaicloud/vault-env:1.3.2 /usr/local/bin/vault-env /usr/local/bin/

RUN apk add --no-cache mysql-client mariadb-mytop
RUN adduser -D -s /bin/sh -u 1000 mintel --home /home/mintel

COPY docker-entrypoint.sh /

USER 1000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/pause"]
