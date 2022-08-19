FROM golang:alpine3.16 as build

WORKDIR /app

COPY rocks.go .

RUN go build rocks.go



FROM scratch
COPY --from=build /app /app

ENTRYPOINT ["./app/rocks"]