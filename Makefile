ROOT_DIR = $(patsubst %/,%,$(filter %/, $(dir $(realpath $(firstword $(MAKEFILE_LIST))))))

.PHONY: ppa build ours

ppa:
	docker build ppa -t ppa
	docker run --rm -it ppa

build:
	docker build build -t build
	docker run -v "$(ROOT_DIR)/ours/index:/out" build

ours:
	docker build ours -t ours
	docker run --rm -it ours
