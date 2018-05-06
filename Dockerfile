FROM golang:1.10 AS builder

MAINTAINER surya.tresna@gmail.com

ENV PATH_PROJECT github.com/suryatresna/gogql-boilerplate
ENV APP_ENV develop

RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 &&\
    chmod +x /usr/local/bin/dep &&\
    curl https://glide.sh/get | sh && go get github.com/pilu/fresh
    

RUN mkdir -p /go/src/${PATH_PROJECT}
WORKDIR /go/src/${PATH_PROJECT}

COPY Gopkg.toml Gopkg.lock ./

RUN dep ensure -vendor-only
COPY . .


CMD if [ ${APP_ENV} = develop ]; \ 
    then \
    make run-dev;\
    else \
    make run; \
    fi
	
EXPOSE 8080