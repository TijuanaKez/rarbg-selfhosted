FROM arm32v7/golang:latest AS build

RUN apk add gcc musl-dev

RUN mkdir /app

COPY . /app

RUN cd /app && go build

FROM alpine:3.18

COPY --from=build /app/rarbg-selfhosted /rarbg-selfhosted

COPY ./trackers.txt /trackers.txt

ENTRYPOINT ["/rarbg-selfhosted"]
