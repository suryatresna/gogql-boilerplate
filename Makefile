APPNAME:=gogql

all: test build

run: build start

build:
	@echo " >> building binaries"
	@go build -race -o bin/${APPNAME} src/cmd/app.go

start:
	@echo " >> starting binaries"
	@./bin/${APPNAME}