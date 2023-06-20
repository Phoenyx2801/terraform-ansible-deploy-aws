FROM golang:1.18 as build
WORKDIR app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=build /go/app/server /app
ENTRYPOINT ["/app/server"]