FROM golang:latest AS builder

WORKDIR /go/src/app

COPY . .

ENV GO111MODULE=off

RUN go build -o main .

FROM scratch

COPY --from=builder /go/src/app/main /

CMD ["/main"]