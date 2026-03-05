IMAGE_NAME = valheim_host
TAG = latest

build:
	sudo docker buildx build -t $(IMAGE_NAME):$(TAG) --platform linux/amd64 .

interactive:
	sudo docker run \
		-p 2456/tcp \
		-p 2456/udp \
		-p 2457/udp \
		-it --user steam --platform linux/amd64 $(IMAGE_NAME):$(TAG) /bin/bash



arm:
	sudo docker run -it --user steam --platform linux/amd64 -e CPU_MHZ=2500 $(IMAGE_NAME):$(TAG) /bin/bash

