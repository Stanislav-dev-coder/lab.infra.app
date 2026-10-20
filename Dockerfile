FROM golang:1.27.2-alpine3.24 AS build
WORKDIR /src
COPY . .
ARG VERSION=dev
RUN CGO_ENABLED=0 go build -ldflags "-X main.version=${VERSION}" -o /app .

FROM alpine:3.24
COPY --from=build /app /app
ENTRYPOINT ["/app"]
