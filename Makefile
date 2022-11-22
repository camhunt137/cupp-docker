include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

# ==================================================================================== #
# DOCKER
# ==================================================================================== #

## docker/build: build docker image
.PHONY: docker/build
docker/build:
	docker build -t cupp:v1 .

## docker/run: run docker container
.PHONY: docker/run
docker/run:
	docker run -it cupp:v1

## docker/clean: remove docker image
.PHONY: docker/clean
docker/clean:
	docker rmi cupp:v1

## docker/shell: run docker container with shell
.PHONY: docker/shell
docker/shell:
	docker run -it cupp:v1 /bin/bash

## docker/tag: tag docker image
.PHONY: docker/tag
docker/tag:
	docker tag cupp:v1 camhunt137/cupp:v1

## docker/push: push docker image
.PHONY: docker/push
docker/push:
	docker push camhunt137/cupp:v1

# ==================================================================================== #
# DEPLOY
# ==================================================================================== #

## biolib push: run the cmd/api application
.PHONY: biolib/push
biolib/push:
	biolib push ATGCCTCCGGAGCGGGGC/cupp
