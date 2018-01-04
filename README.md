# Snapcraft in Docker Container

From [snapcraft.io](https://snapcraft.io/):

    Snapcraft is the command line tool for writing and publishing your software
    as a snap.

    Snaps are available for any Linux OS running snapd, the service that run
    and manage snaps.

In simpler words, instead of packaging your application as rpm or deb, you can
package it as a snap. This snap is contained in a secure manner and has an
easier lifecycle management, similar to Docker images and containers.

Snaps are built with ``snapcraft`` which runs very well on Ubuntu 16.04 Xenial.
If you want to build snaps on, say macOS, you can use a Docker container. In
this case, Ubuntu 16.04 runs in a Docker container and you can run
``snapcraft`` to create snaps. The same workflow thus works on any Linux or
Windows box where this Docker container can run.

This repo only helps create a Docker image that is capable of running
``snapcraft``. To actually build a snap, you should create a container from
this image and run ``snapcraft`` as needed/intended. To make things easier
for everyone, this [Docker image is available on Docker Hub](https://hub.docker.com/r/codeghar/snapcraft/).

To run a container, use the following command:

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

There's a *Makefile* included that makes it easier to build an image and run
a container locally.

There were some issues in getting this to work. The following two resources
were super useful in troubleshooting and fixing issues:

* https://github.com/ogra1/snapd-docker/blob/master/build.sh
* https://forum.snapcraft.io/t/snapd-in-docker/177/11
