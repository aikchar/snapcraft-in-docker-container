# Snapcraft in Docker Container

**NOTICE: DO NOT USE THIS REPO ANYMORE. USE https://hub.docker.com/r/snapcore/snapcraft/ INSTEAD.**

From [snapcraft.io](https://snapcraft.io/):

    Snapcraft is the command line tool for writing and publishing your software
    as a snap.

    Snaps are available for any Linux OS running snapd, the service that run
    and manage snaps.

In simpler words, instead of packaging your application as rpm or deb, you can
package it as a snap. This snap is contained in a secure manner and has an
easier lifecycle management, similar to Docker images and containers.

Snaps are built with ``snapcraft`` which runs very well on Ubuntu 16.04 Xenial.
If you want to build snaps on, say macOS, you can use a Docker container. The same
workflow thus works on any Linux or Windows box where this Docker container can run.

This repo helped to create a Docker image that is capable of running
``snapcraft``. To actually build a snap, you had to create a container from
this image and run ``snapcraft`` as needed/intended. To make things easier
for everyone, this [Docker image is available on Docker Hub](https://hub.docker.com/r/codeghar/snapcraft/)
but is **no longer supported** and is present for historical purposes only.
