FROM golang:1.10 AS builder

RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 &&\
    chmod +x /usr/local/bin/dep

RUN mkdir -p /go/src/github.com/suryatresna/gogql-boilerplate
WORKDIR /go/src/github.com/suryatresna/gogql-boilerplate

COPY Gopkg.toml Gopkg.lock ./

RUN dep ensure -vendor-only
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -a -installsuffix cgo -o suryatresna/gogql-boilerplate 

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/github.com/suryatresna/gogql-boilerplate  .
ENTRYPOINT ["./suryatresna/gogql-boilerplate"]