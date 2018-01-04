.PHONY: all build run

build:
	docker build \
		--tag codeghar/snapcraft:latest \
		.

all: build run

run:
	docker run \
        --name=snappy \
        -d \
        -it \
        --tmpfs /run \
        --tmpfs /run/lock \
        --tmpfs /tmp \
        --cap-add SYS_ADMIN \
        --device=/dev/fuse \
        --security-opt apparmor:unconfined \
        --security-opt seccomp:unconfined \
        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
        -v /lib/modules:/lib/modules:ro \
        codeghar/snapcraft:latest
