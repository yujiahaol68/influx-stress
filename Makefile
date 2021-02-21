all: build

build:
	go build github.com/yujiahaol68/influx-stress/cmd/influx-stress

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" github.com/yujiahaol68/influx-stress/cmd/influx-stress

test:
	go test -v github.com/yujiahaol68/influx-stress/lineprotocol
	go test -v github.com/yujiahaol68/influx-stress/point
	go test -v github.com/yujiahaol68/influx-stress/write

help:
	go run cmd/influx-stress/main.go insert help

insert:
	go run cmd/influx-stress/main.go insert -r 10s -f

fmt:
	go fmt ./...

clean:
	rm -rf influx-stress

