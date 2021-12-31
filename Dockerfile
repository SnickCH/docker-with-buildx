ARG DOCKER_VERSION=latest
ARG BUILDX_VERSION=latest

FROM docker/buildx-bin:${BUILDX_VERSION} as buildx

FROM docker:${DOCKER_VERSION}

COPY --from=buildx /buildx /usr/lib/docker/cli-plugins/docker-buildx
