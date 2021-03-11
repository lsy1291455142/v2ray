FROM alpine:3.13.2

ENV RELEASE="Xray 1.3.1" \
    UUID="00000000-0000-0000-0000-000000000000"

WORKDIR /opt

COPY . .

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
