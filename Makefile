IMAGE_NAME = valheim_host
TAG = latest

build:
	docker buildx build -t $(IMAGE_NAME):$(TAG) --platform linux/amd64 .

interactive:
	docker run -it --user steam --platform linux/amd64 $(IMAGE_NAME):$(TAG) /bin/bash

arm:
	docker run -it --user steam --platform linux/amd64 -e CPU_MHZ=2500 $(IMAGE_NAME):$(TAG) /bin/bash

