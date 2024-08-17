VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

format:
	gofmt -s -W ./

# install:
# 	go get

lint:
	golint

test:
	go test -v

build:
	# go build -v -o kbot -ldflags "-X="github.com/masteine/kbot/cmd.appVersion=${VERSION}
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/masteine/kbot/cmd.appVersion=${VERSION}

clean:
	rm -rf kbot
