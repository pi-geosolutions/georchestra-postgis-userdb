SHELL := /bin/bash
IMAGE=pigeosolutions/georchestra-postgis-userdb
REV=`git rev-parse --short HEAD`
DATE=`date +%Y%m%d`

all: pull-deps docker-build docker-push

pull-deps:
	docker pull postgis/postgis:15-3.4

docker-build:
	docker build -t ${IMAGE}:latest . ;\
	docker tag  ${IMAGE}:latest ${IMAGE}:${DATE}-${REV}

docker-push:
	docker push ${IMAGE}:latest ;\ ;\
	echo "pushed ${IMAGE}:latest"
	docker push ${IMAGE}:${DATE}-${REV} ;\
	echo "pushed ${IMAGE}:${DATE}-${REV}"
