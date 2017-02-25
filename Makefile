URL?="https://faction-labs.io/"
NAME?=faction-labs.io
VERSION=$(shell date +%Y%m%d)

all: build

build:
	@hugo -b ${URL} --cleanDestinationDir --forceSyncStatic --quiet

package: build
	@sudo box p build -c public -v ${VERSION} ${NAME} package.toml

clean:
	@rm -rf public/*
	@sudo box p delete ${NAME}:${VERSION}

.PHONY: build package
