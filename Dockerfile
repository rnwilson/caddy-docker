FROM alpine:latest

LABEL maintainer "Stephane Clodic (SClo) (https://github.com/sclo)" \
      architecture="amd64"

# http.minify http.realip
ARG plugins=http.cache,http.expires,http.filter,http.ratelimit

RUN echo "DEBUG: >>>${plugins}<<<"
RUN apk upgrade --no-cache --available \
    && apk add --no-cache \
      ca-certificates \
      curl \
      tar \
    && curl \
      --silent \
      --show-error \
      --fail \
      --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" \
      -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=${plugins}" \
    | tar \
      --no-same-owner \
      -C /usr/bin/ \
      -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && apk del \
      curl \
      tar

EXPOSE 80 443 2015
VOLUME /etc/caddycerts
WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
