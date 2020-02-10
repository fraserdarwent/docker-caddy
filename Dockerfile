ARG GOLANG_VERSION

FROM golang:${GOLANG_VERSION}-alpine as builder

WORKDIR /src

RUN apk add --no-cache \
  git \
  ca-certificates

ARG CADDY_VERSION
RUN git clone -b v${CADDY_VERSION} https://github.com/caddyserver/caddy.git --single-branch

WORKDIR /src/caddy/cmd/caddy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
  go build -trimpath -tags netgo -ldflags '-extldflags "-static" -s -w' -o /usr/bin/caddy

FROM scratch AS scratch

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]