APPNAME:=gogql

all: test build

run: build start

run-dev: start-dev

build:
	@echo " >> building binaries"
	@go build -race -o bin/${APPNAME} src/cmd/app.go

start:
	@echo " >> starting binaries"
	@./bin/${APPNAME}

start-dev:
	@echo " >> starting binaries develop"
	@fresh src/cmd/app.go