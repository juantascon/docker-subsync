#! /bin/bash
tag=docker.io/juantascon/subsync
podman build . -t $tag && podman push $tag
