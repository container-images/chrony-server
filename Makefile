.PHONY: build run default

IMAGE_NAME = chrony


default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	# gives too many permissions, avoid using this if possible:
	# docker run --privileged -v /etc/chrony.conf:/etc/chrony.conf:ro -d $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	#docker run --net=host --cap-add SYS_TIME -v /etc/chrony.conf:/etc/chrony.conf:ro -d $(IMAGE_NAME)
	docker run --net=host --cap-add SYS_TIME -d $(IMAGE_NAME)

runfg: build
	# gives too many permissions:
	# docker run --privileged -v /etc/chrony.conf:/etc/chrony.conf:ro $(IMAGE_NAME)
	# better solution, needs docker-1.12:
	#docker run --net=host -it --cap-add SYS_TIME -v /etc/chrony.conf:/etc/chrony.conf:ro $(IMAGE_NAME)
	docker run --net=host -it --cap-add SYS_TIME $(IMAGE_NAME)

test:
	run_test.sh
